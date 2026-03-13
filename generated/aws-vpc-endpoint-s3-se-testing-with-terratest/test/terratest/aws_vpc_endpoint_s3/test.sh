#!/bin/bash
set -euo pipefail

echo "Running go mod tidy..."
go mod tidy
echo "Go modules tidied successfully."

# Install dependencies for reporting (optional)
go install gotest.tools/gotestsum@latest || true
go install github.com/tebeka/go-junit-report/v2@latest || true

export PATH="$PATH:$(go env GOPATH)/bin"

# AWS provider reads auth from AWS_* env vars.
if [[ -z "${AWS_DEFAULT_REGION:-}" ]]; then
  echo "WARNING: AWS_DEFAULT_REGION not set. Defaulting to us-east-1." >&2
  export AWS_DEFAULT_REGION="us-east-1"
fi

mkdir -p test-reports

echo "Running terratest..."
if command -v gotestsum >/dev/null 2>&1; then
  gotestsum --format standard-verbose --junitfile test-reports/junit.xml ./... | tee test-reports/test-output.txt
else
  go test -v ./... 2>&1 | tee test-reports/test-output.txt
fi

echo "All tests completed. Reports are available in the test-reports folder."
