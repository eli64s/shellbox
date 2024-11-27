#!/usr/bin/env bash

PROJECT_NAME="INSERT_PROJECT_NAME"

directories=("conf" "scripts" "setup" "src" "tests")

for dir in "${directories[@]}"; do
  mkdir -p "$dir"
done

files=("__init__.py" "preprocess.py" "model.py" "utils.py")
test_files=("__init__.py" "test_main.py" "test_conf.py" "test_logger.py" "test_preprocess.py" "test_model.py" "test_utils.py")

for file in "${files[@]}"; do
  touch "src/$file"
done

for file in "${test_files[@]}"; do
  touch "tests/$file"
done

# conf.toml
cat <<EOF >conf/conf.toml
[api]
endpoint = "https://api.example.com"
token = "your_api_token"

[database]
account = "your_database_account"
host = "your_database_host"
table = "your_database_table"
schema = "your_database_schema"
database = "your_database_name"
warehouse = "your_database_warehouse"

[paths]
config_path = "/path/to/config"
data_path = "/path/to/data"
output_path = "/path/to/output"
EOF

# main.py
cat <<EOF >src/main.py
"""Main script for the <package_name> package."""

import argparse
from pathlib import Path

import dacite
import toml

from conf import AppConfig
from logger import Logger

CONF = "conf/conf.toml"
LOGGER = Logger("my_logger")


def main() -> None:
    LOGGER.info("Starting execution...")

    # Configuration
    conf_path = Path(CONF).resolve()
    conf_dict = toml.load(conf_path)
    conf = dacite.from_dict(AppConfig, conf_dict)

    # Command line arguments
    parser = argparse.ArgumentParser(description="")
    parser.add_argument("-o", "--output", type=str, help="Output file path")
    args = parser.parse_args()
    if args.output:
        conf.paths.output_path = Path(args.output)

    LOGGER.info("Execution finished successfully!")


if __name__ == "__main__":
    main()
EOF

# conf.py
cat <<EOF >src/conf.py
"""Dataclass configuration constants for the application."""

from dataclasses import dataclass
from pathlib import Path


@dataclass
class ApiConfig:
    """API configuration."""
    endpoint: str
    token: str


@dataclass
class DatabaseConfig:
    """Driver configuration."""
    account: str
    host: str
    table: str
    schema: str
    database: str
    warehouse: str


@dataclass
class PathsConfig:
    """Paths configuration."""
    config_path: Path
    data_path: Path
    output_path: Path


@dataclass
class AppConfig:
    """Application configuration."""
    api: ApiConfig
    database: DatabaseConfig
    paths: PathsConfig
EOF

# logger.py
cat <<EOF >src/logger.py
"""Logger module for the project."""

import logging

import colorlog


class Logger:
    def __init__(self, name, level=logging.INFO):
        self.logger = logging.getLogger(name)
        self.logger.setLevel(level)
        self._configure_logger()

    def _configure_logger(self):
        handler = logging.StreamHandler()
        handler.setFormatter(self._get_formatter())
        self.logger.addHandler(handler)
        self.logger.handlers = [handler]

    def _get_formatter(self):
        return colorlog.ColoredFormatter(
            "%(log_color)s%(asctime)s:%(levelname)s:%(name)s:%(message)s",
            log_colors={
                "DEBUG": "blue",
                "INFO": "green",
                "WARNING": "yellow",
                "ERROR": "red",
                "CRITICAL": "red,bg_white",
            },
            reset=True,
            secondary_log_colors={},
        )

    def info(self, msg, *args, **kwargs):
        self.logger.info(msg, *args, **kwargs)

    def debug(self, msg, *args, **kwargs):
        self.logger.debug(msg, *args, **kwargs)

    def warning(self, msg, *args, **kwargs):
        self.logger.warning(msg, *args, **kwargs)

    def error(self, msg, *args, **kwargs):
        self.logger.error(msg, *args, **kwargs)

    def critical(self, msg, *args, **kwargs):
        self.logger.critical(msg, *args, **kwargs)
EOF

# pre-commit-config.yaml
cat <<EOF >.pre-commit-config.yaml
# See https://pre-commit.com for more information
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: check-added-large-files
      - id: check-ast
      - id: check-builtin-literals
      - id: check-docstring-first
      - id: check-json
      - id: check-merge-conflict
      - id: check-symlinks
      - id: check-yaml
      - id: debug-statements
      - id: end-of-file-fixer
      - id: mixed-line-ending
      - id: trailing-whitespace
  - repo: https://github.com/psf/black
    rev: 23.3.0
    hooks:
      - id: black
EOF

# pyproject.toml
cat <<EOF >pyproject.toml
# Black formatting
[tool.black]
line-length = 79
include = '\.pyi?$'
exclude = '''
/(
      .eggs     
    | .git         
    | .hg
    | .mypy_cache
    | .pytest_cache
    | .tox
    | venv
    | benchmarks
    | _build
    | buck-out
    | build
    | dist
  )/
'''

# Flake8
[flake8]
max-line-length = 79

# iSort
[tool.isort]
profile = "black"
line_length = 79
multi_line_output = 3
include_trailing_comma = true
virtual_env = "conda"

# Pytest
[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = "test_*.py"
addopts = "--strict-markers --disable-pytest-warnings"

# Pytest coverage
[tool.coverage.run]
omit = [
    "tests/*",
    "setup.py",
    "*/__init__.py"
]
EOF

# setup.py
cat <<EOF >setup.py
"""Setup script for the <package_name> package."""

from pathlib import Path

from setuptools import find_namespace_packages, setup

BASE_DIR = Path(__file__).parent

with open(BASE_DIR / "requirements.txt") as file:
    required_packages = [line.strip() for line in file]

docs_packages = ["mkdocs", "mkdocstrings"]
style_packages = ["black==21.9b0", "flake8", "isort"]
test_packages = [
    "pytest",
    "pytest-cov",
    "great-expectations",
]

setup(
    name="<package_name>",
    version="1.0.0",
    description="""
        <Package description here>""",
    author="<author_name>",
    author_email="<author_email>",
    url="https://github.com/<author_username>/<package_name>",
    python_requires=">=3.7",
    packages=find_namespace_packages(),
    install_requires=required_packages,
    extras_require={
        "dev": docs_packages
        + style_packages
        + test_packages
        + ["pre-commit==2.15.0"],
        "test": test_packages,
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    keywords=[
        "<keywords>",
    ],
    project_urls={
        "Documentation": "https://github.com/<author_username>/<package_name>/blob/main/README.md",
        "Source Code": "https://github.com/<author_username>/<package_name>",
    },
)
EOF

# requirements.txt
cat <<EOF >requirements.txt
mkdocs
mkdocstrings
black==21.9b0
flake8
isort
pytest
pytest-cov
great-expectations
pre-commit==2.15.0
pandas
colorlog
dacite
toml
EOF

# Makefile
cat <<EOF >Makefile
# Makefile

SHELL = /bin/bash
VENV := VENV_NAME

.PHONY: help style clean conda venv mem_profile profile

# Help
help:
	@echo "Commands:"
	@echo "clean      : cleans all unnecessary files."
	@echo "style      : executes style formatting."
	@echo "conda      : creates a conda environment."
	@echo "venv       : creates a virtual environment."

# Style
.PHONY: style
style:
	black .
	flake8
	isort .

# Clean
.PHONY: clean
clean: style
	bash scripts/clean.sh

# Conda Environment
conda:
	conda create -n \$(VENV) python=3.9 -y
	conda activate \$(VENV) && pip install -r requirements.txt

# Python Virtual Environment
venv:
	python -m venv \$(VENV)
	source \$(VENV)/bin/activate
	pip install -r requirements.txt
EOF

# Dockerfile
cat <<EOF >Dockerfile
# Base image
FROM python:3.9-slim-buster

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Set environment variables if needed
# ENV MY_VARIABLE=value

# Expose any necessary ports
# EXPOSE 8080

# Define the command to run your application
CMD ["python", "src/main.py"]
EOF

# docker-compose.yml
cat <<EOF >docker-compose.yml
version: "3.9"
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    volumes:
      - .:/app
    ports:
      - 8080:8080  # Adjust the port numbers as needed
    environment:
      # Add any necessary environment variables here
      # - MY_VARIABLE=value
    command: python src/main.py
EOF

# LICENSE
cat <<EOF >LICENSE
MIT License

Copyright (c) 2023 INSERT_GITHUB_USERNAME

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

# .gitignore
cat <<EOF >.gitignore
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
bin/
build/
develop-eggs/
dist/
eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.coverage
.tox/
.nox/
.coverage.*
*.cover
.hypothesis/
.pytest_cache/

# Translations
*.mo
*.pot

# Documentation
docs/_build/
site/
*.png
*.jpg
*.jpeg
*.gif
*.svg
*.ico
*.mdx

# Credentials
.env
.env.*
.envrc
secrets.ini
secrets.yaml
secrets.yml
secrets.json

# Virtual environments
.venv/
venv/
env/
ENV/

# Development tools
.idea/
.vscode/
*.sublime-project
*.sublime-workspace
.sublime/
.venv/
.project
.pydevproject

# macOS / OS X
.DS_Store

# Editor backups
*~
*.swp
*#
._*

# Log files
logs/
log/
*.log

# Temp files
.temp/
.temp.*
.temp-*/

# Miscellaneous
*~
.project
.project.*
.cache/
.ccls-cache/
*.bak
*.bak.*
*.tmp
*.tmp.*
*.swp
*.swp.*
*~
*.backup
*.sql
*.csv
*.ini
*.jar
*.war
*.ear
*.xls
*.xlsx
*.ppt
*.pptx
*.doc
*.docx
EOF
