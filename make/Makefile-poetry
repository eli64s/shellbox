# poetry: https://python-poetry.org/docs/

REQUIREMENTS := requirements.txt
REQUIREMENTS_DEV := requirements-dev.txt

.PHONY: clean-env
clean-env: remove-env install  ## Manage Poetry environment

.PHONY: install
install: ## Install all dependencies
	poetry install

.PHONY: remove-env
remove-env: ## Remove Poetry environment
	poetry env remove --all
	rm -f poetry.lock

.PHONY: requirements-all
requirements: requirements-main requirements-dev  ## Generate requirements files

.PHONY: requirements-dev
requirements-dev: ## Generate requirements-dev.txt file for development dependencies.
	poetry export -f requirements.txt --output $(REQUIREMENTS_DEV) --without-hashes --with dev,docs,test

.PHONY: requirements-main
requirements-main: ## Generate requirements.txt file for main dependencies.
	poetry export -f requirements.txt --output $(REQUIREMENTS) --without-hashes

.PHONY: help
help: ## Display this help
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@awk 'BEGIN {FS = ":.*?## "; printf "\033[1m%-20s %-50s\033[0m\n", "Target", "Description"; \
	              printf "%-20s %-50s\n", "------", "-----------";} \
	      /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %-50s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
