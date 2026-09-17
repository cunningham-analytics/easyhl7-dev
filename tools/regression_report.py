import argparse
import ast
import json
import re
import subprocess
from pathlib import Path


DEV_ROOT = Path(__file__).resolve().parents[1]
PACKAGE_ROOT = DEV_ROOT.parent / "easyhl7"

CONFIG_ROOT = PACKAGE_ROOT / "macros" / "configs"
REPORT_ROOT = DEV_ROOT / "regression_reports"


def version_slug(version: str) -> str:
    return f"v{version.replace('.', '_')}"


def find_config_file(version: str, message_type: str) -> Path:
    macro_name = (
        f"config_{version_slug(version)}_{message_type.upper()}"
    )

    for path in CONFIG_ROOT.rglob("*.sql"):
        text = path.read_text()

        if re.search(
            rf"{{%\s*macro\s+{re.escape(macro_name)}\s*\(\s*\)\s*%}}",
            text,
        ):
            return path

    raise FileNotFoundError(
        f"Could not find macro {macro_name} under {CONFIG_ROOT}"
    )


def load_config(path: Path) -> dict:
    text = path.read_text()

    match = re.search(
        r"{%\s*set\s+config\s*=\s*(.*?)\s*%}",
        text,
        re.DOTALL,
    )

    if not match:
        raise ValueError(
            f"Could not find config dictionary in {path}"
        )

    config_text = match.group(1)

    config_text = re.sub(r"\bnone\b", "None", config_text)
    config_text = re.sub(r"\btrue\b", "True", config_text)
    config_text = re.sub(r"\bfalse\b", "False", config_text)

    return ast.literal_eval(config_text)


def get_groups(node: dict) -> list[dict]:
    groups = []

    for child in node.get("children", []):
        if child.get("type") == "group":
            groups.append(child)
            groups.extend(get_groups(child))

    return groups


def model_name(
    message_type: str,
    suffix: str,
    version: str,
) -> str:
    return (
        f"{message_type.lower()}__{suffix}__{version_slug(version)}"
    )


def run_dbt_show(model: str) -> list[dict]:
    command = [
        "uv",
        "run",
        "dbt",
        "show",
        "--select",
        model,
        "--output",
        "json",
        "--limit",
        "-1",
    ]

    result = subprocess.run(
        command,
        cwd=DEV_ROOT,
        capture_output=True,
        text=True,
    )

    if result.returncode != 0:
        raise RuntimeError(
            f"dbt show failed for {model}:\n{result.stderr}"
        )

    output = result.stdout

    json_start = output.find("{")

    if json_start == -1:
        raise RuntimeError(
            f"No JSON output found for {model}:\n{output}"
        )

    try:
        data = json.loads(output[json_start:])
    except json.JSONDecodeError as exc:
        raise RuntimeError(
            f"Could not parse dbt show output for {model}:\n{output}"
        ) from exc

    return data.get("show", [])


def format_value(value) -> str:
    if value is None:
        return "NULL"

    if isinstance(value, (dict, list)):
        return json.dumps(
            value,
            separators=(",", ":"),
            sort_keys=True,
        )

    return str(value)


def format_table(rows: list[dict]) -> str:
    if not rows:
        return "(no rows)"

    columns = list(rows[0].keys())

    widths = {
        column: len(column)
        for column in columns
    }

    formatted_rows = []

    for row in rows:
        formatted = {
            column: format_value(row.get(column))
            for column in columns
        }

        formatted_rows.append(formatted)

        for column in columns:
            widths[column] = max(
                widths[column],
                len(formatted[column]),
            )

    header = " | ".join(
        column.ljust(widths[column])
        for column in columns
    )

    separator = "-+-".join(
        "-" * widths[column]
        for column in columns
    )

    body = "\n".join(
        " | ".join(
            row[column].ljust(widths[column])
            for column in columns
        )
        for row in formatted_rows
    )

    return f"{header}\n{separator}\n{body}"


def add_section(
    report: list[str],
    title: str,
    model: str,
) -> None:
    print(f"READ   {model}")

    rows = run_dbt_show(model)

    report.extend([
        "",
        "=" * 80,
        title,
        f"MODEL: {model}",
        f"ROWS: {len(rows)}",
        "=" * 80,
        format_table(rows),
    ])


def generate_report(
    version: str,
    message_type: str,
) -> Path:
    message_type = message_type.upper()

    config_path = find_config_file(
        version,
        message_type,
    )
    config = load_config(config_path)

    groups = get_groups(config)

    report = [
        "EASYHL7 REGRESSION REPORT",
        f"Version: {version}",
        f"Message: {message_type}",
        f"Config: {config_path.relative_to(PACKAGE_ROOT)}",
    ]

    hierarchy_model = model_name(
        message_type,
        "hierarchy",
        version,
    )

    add_section(
        report,
        "HIERARCHY",
        hierarchy_model,
    )

    for group in groups:
        group_name = group["name"]

        group_model = model_name(
            message_type,
            group_name.lower(),
            version,
        )

        add_section(
            report,
            group_name,
            group_model,
        )

    REPORT_ROOT.mkdir(
        parents=True,
        exist_ok=True,
    )

    report_path = (
        REPORT_ROOT
        / f"{message_type.lower()}__{version_slug(version)}.txt"
    )

    report_path.write_text(
        "\n".join(report) + "\n"
    )

    return report_path


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate an EasyHL7 regression report."
    )

    parser.add_argument(
        "--version",
        required=True,
        help="HL7 version, e.g. 2.4",
    )

    parser.add_argument(
        "--message",
        required=True,
        help="HL7 message type, e.g. ORM_O01",
    )

    args = parser.parse_args()

    report_path = generate_report(
        version=args.version,
        message_type=args.message,
    )

    print()
    print(
        f"REPORT {report_path.relative_to(DEV_ROOT)}"
    )


if __name__ == "__main__":
    main()