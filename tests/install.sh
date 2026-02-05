#!/usr/bin/env bash
set -e

git config core.hooksPath tests/githooks
chmod +x tests/githooks/pre-commit