#!/bin/bash

# Create project directories
mkdir -p conf logger model processor setup scripts src tests
mkdir setup 

touch README.md requirements.txt setup.py conf/conf.toml
touch scripts/run.sh scripts/test.sh setup/setup.sh
touch src/__init__.py src/conf.py src/logger.py src/main.py src/model.py src/preprocess.py
touch tests/test_conf.py tests/test_logger.py tests/test_main.py tests/test_model.py tests/test_preprocess.py

# Main script
cat <<EOF > src/main.py
"""Main script"""
import argparse
from pathlib import Path
import dacite
import pandas as pd
import toml
from conf import AppConfig
from logger import Logger
import model
import processor
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
    if args.api_key:
        conf.path.output_file = args.output
    LOGGER.info("Execution finished successfully!")
if __name__ == "__main__":
    main()
EOF

# Data Class configuration
cat <<EOF > src/conf.py
from dataclasses import dataclass
from pathlib import Path
@dataclass
class Driver:
    name: str
@dataclass
class Paths:
    output_path: Path
@dataclass
class AppConfig:
    driver: Driver
    paths: Paths
EOF

# Logger
cat <<EOF > src/logger.py
"""Logger module"""
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
