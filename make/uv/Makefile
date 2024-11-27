# -- Makefile for uv projects

.PHONY: uv-editable
uv-editable: ## Install all project dependencies in editable mode
	uv pip install -e ".[dev,test,docs]"

.PHONY: uv-install
uv-install: ## Install all project dependencies
	uv pip install -r pyproject.toml --all-extras

.PHONY: uv-lock
uv-lock: ## Lock dependencies declared in pyproject.toml
	uv pip compile pyproject.toml -o requirements.txt
	uv pip compile pyproject.toml --extra dev --extra docs --extra test -o requirements-dev.txt

.PHONY: uv-sync
uv-sync: ## Sync environment with requirements files
	uv pip sync requirements.txt
	uv pip sync --dev requirements-dev.txt

.PHONY: uv-venv
uv-venv: ## Create a virtual environment using uv
	uv venv --python 3.11
	uv sync
	uv sync --dev

.PHONY: help
help: ## Displays the help menu
	@echo "Available Commands:"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
