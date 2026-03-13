#!/bin/bash

set -e

echo "Running Terratest..."

cd test/terratest

go mod tidy

go test -v ./...

echo "Completed"
