SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c

HUGO_DIR := lorenziblog
PUBLIC_DIR := $(HUGO_DIR)/public
HUGO ?= hugo

.PHONY: help build src-commit public-commit publish

help:
	@echo "Targets:"
	@echo "  build         Build the Hugo site into $(PUBLIC_DIR)"
	@echo "  src-commit    Commit source changes in the parent repo"
	@echo "  public-commit Commit + push in $(PUBLIC_DIR) with auto message"
	@echo "  publish       src-commit + build + public-commit"
	@echo ""
	@echo "Optional vars:"
	@echo "  MSG=\"...\"    Override auto commit message for src-commit"

build:
	@cd $(HUGO_DIR) && $(HUGO)

src-commit:
	@git add -A
	@if git diff --cached --quiet; then \
		echo "No source changes to commit."; \
	else \
		msg="$(MSG)"; \
		if [[ -z "$$msg" ]]; then \
			last_num=$$(git log --pretty=%s 2>/dev/null | sed -n 's/^automatic update #\\([0-9]\\+\\).*$$/\\1/p' | head -n1); \
			if [[ -z "$$last_num" ]]; then next=1; else next=$$((last_num+1)); fi; \
			msg="automatic update #$$next"; \
		fi; \
		echo "Commit message: $$msg"; \
		git commit -m "$$msg"; \
	fi

public-commit:
	@cd $(PUBLIC_DIR) && \
		git add -A && \
		if git diff --cached --quiet; then \
			echo "No public changes to commit."; \
		else \
			last_num=$$(git log --pretty=%s 2>/dev/null | sed -n 's/^automatic update #\\([0-9]\\+\\).*$$/\\1/p' | head -n1); \
			if [[ -z "$$last_num" ]]; then next=1; else next=$$((last_num+1)); fi; \
			msg="automatic update #$$next"; \
			echo "Commit message: $$msg"; \
			git commit -m "$$msg"; \
			git push; \
		fi

publish: src-commit build public-commit
