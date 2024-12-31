# uv: https://docs.astral.sh/uv/

PY_VERSION := 3.11

.PHONY: build
build: ## Build the distribution package using uv
	uv build
	uv pip install dist/splitme_ai-0.1.0-py3-none-any.whl

.PHONY: install
install: ## Install all dependencies from pyproject.toml
	uv sync --dev --group test --group docs --group lint --all-extras

.PHONY: install-editable
install-editable:: ## Install all project dependencies in editable mode
	uv pip install -e ".[dev,docs,test]"

.PHONY: lock
lock: ## Lock dependencies declared in pyproject.toml
	uv pip compile pyproject.toml --all-extras

.PHONY: requirements
requirements: ## Generate requirements files from pyproject.toml
	uv pip compile pyproject.toml -o requirements.txt
	uv pip compile pyproject.toml --all-extras -o requirements-dev.txt

.PHONY: sync
sync: ## Sync environment with pyproject.toml
	uv sync --all-groups --dev

.PHONY: update
update: ## Update all dependencies from pyproject.toml
	uv lock --upgrade

.PHONY: venv
venv: ## Create a virtual environment
	uv venv --python $(PY_VERSION)


# -- Utilities ---------------------------------------------------------------


.PHONY: extract-packages
extract-packages: uv-requirements ## Extract packages from requirements files
    @grep -E '^[a-zA-Z0-9_\-\.]+==' requirements.txt | cut -d'=' -f1 > _requirements.txt
    @grep -E '^[a-zA-Z0-9_\-\.]+==' requirements-dev.txt | cut -d'=' -f1 > _requirements-dev.txt

.PHONY: help
help: ## Display this help
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@awk 'BEGIN {FS = ":.*?## "; printf "\033[1m%-20s %-50s\033[0m\n", "Target", "Description"; \
	              printf "%-20s %-50s\n", "------", "-----------";} \
	      /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %-50s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
