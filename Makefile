.PHONY: help install install-dev test lint format type-check security clean build upload-test upload docs

help:
	@echo "DumpConfluence Development Commands"
	@echo "=================================="
	@echo "install         Install package for production"
	@echo "install-dev     Install package with development dependencies"
	@echo "test            Run tests with coverage"
	@echo "lint            Run linting checks (ruff)"
	@echo "format          Format code with black and ruff"
	@echo "type-check      Run type checking with mypy"
	@echo "security        Run security checks (bandit + safety)"
	@echo "clean           Clean build artifacts"
	@echo "build           Build package for distribution"
	@echo "upload-test     Upload to TestPyPI"
	@echo "upload          Upload to PyPI"
	@echo "docs            Generate documentation"
	@echo "pre-commit      Install and run pre-commit hooks"

install:
	pip install -e .

install-dev:
	pip install -e ".[dev]"

test:
	pytest tests/ -v --cov=dumpconfluence --cov-report=term-missing --cov-report=html

lint:
	ruff check dumpconfluence/
	ruff check tests/

format:
	black dumpconfluence/ tests/
	ruff format dumpconfluence/ tests/
	ruff check dumpconfluence/ tests/ --fix

type-check:
	mypy dumpconfluence/ --ignore-missing-imports

security:
	bandit -r dumpconfluence/ -f json
	safety check --json

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf .coverage
	rm -rf htmlcov/
	rm -rf .pytest_cache/
	rm -rf .mypy_cache/
	find . -type d -name __pycache__ -delete
	find . -type f -name "*.pyc" -delete

build: clean
	python -m build

upload-test: build
	python -m twine upload --repository testpypi dist/*

upload: build
	python -m twine upload dist/*

docs:
	@echo "Documentation available in README.md and CHANGELOG.md"

pre-commit:
	pre-commit install
	pre-commit run --all-files

# Quality checks (run before commit)
check: lint type-check test security
	@echo "All quality checks passed!"

# Release preparation
release-check: clean check build
	@echo "Package ready for release!"
	@ls -la dist/