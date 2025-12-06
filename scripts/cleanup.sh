#!/bin/bash

# Cleanup and reset infrastructure services

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODESPACE_DIR="$(dirname "$SCRIPT_DIR")"

echo "🧹 Cleaning up infrastructure..."
echo ""

read -p "This will DELETE all data in databases and caches. Continue? (yes/no) " -n 3 -r
echo
if [[ ! $REPLY =~ ^yes$ ]]; then
    echo "Aborted."
    exit 1
fi

cd "$CODESPACE_DIR"

# Stop services
echo "Stopping services..."
docker-compose -f .devcontainer/docker-compose.yml down

# Remove volumes
echo "Removing volumes..."
docker volume rm codespace-postgres-data 2>/dev/null || true
docker volume rm codespace-redis-data 2>/dev/null || true
docker volume rm codespace-minio-data 2>/dev/null || true

echo ""
echo "✅ Cleanup complete"
echo ""
echo "Run './scripts/start-money-flows.sh' to start fresh"
echo ""
