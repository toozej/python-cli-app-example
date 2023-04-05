# Set sane defaults for Make
SHELL = bash
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

# Set default goal such that `make` runs `make help`
.DEFAULT_GOAL := help

.PHONY: all build run install pre-commit pre-commit-install pre-commit-run clean help

all: clean build install run ## Run default workflow

clean: ## Clean up built executables
	rm -rf $(CURDIR)/myapp/build/x86_64-unknown-linux-gnu/debug/install/myapp

build: ## Build myapp
	pyoxidizer build --path $(CURDIR)/myapp/

install: ## Install built myapp
	cp $(CURDIR)/myapp/build/x86_64-unknown-linux-gnu/debug/install/myapp $(HOME)/bin/myapp

run:  ## Run built myapp 
	$(HOME)/bin/myapp --help

pre-commit: pre-commit-install pre-commit-run ## Install and run pre-commit hooks

pre-commit-install: ## Install pre-commit hooks and necessary binaries
	# install and update pre-commits
	pre-commit install
	pre-commit autoupdate
	pip install -r $(CURDIR)/requirements.txt

pre-commit-run: ## Run pre-commit hooks against all files
	pre-commit run --all-files

help: ## Display help text
	@grep -E '^[a-zA-Z_-]+ ?:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
