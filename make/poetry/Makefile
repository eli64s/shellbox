# -- Makefile for Poetry projects

POETRY := poetry
REQUIREMENTS :

.PHONY: install
install: ## Install all dependencies
	$(POETRY) install

.PHONY: clean-env
clean-env: remove-env install  ## Manage Poetry environment

.PHONY: remove-env
remove-env: ## Remove Poetry environment
	$(POETRY) env remove --all
	rm -f poetry.lock

.PHONY: requirements-all
requirements: requirements-main requirements-dev  ## Generate requirements files

.PHONY: requirements-dev
requirements-dev:
	$(POETRY) export -f requirements.txt --output $(REQUIREMENTS_DEV) --without-hashes --with dev,docs,test

.PHONY: requirements-main
requirements-main:
	$(POETRY) export -f requirements.txt --output $(REQUIREMENTS) --without-hashes
