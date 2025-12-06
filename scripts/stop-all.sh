#!/bin/bash

# Stop all infrastructure services

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODESPACE_DIR="$(dirname "$SCRIPT_DIR")"

echo "🛑 Stopping all infrastructure services..."
echo ""

cd "$CODESPACE_DIR"
docker-compose -f .devcontainer/docker-compose.yml down

echo ""
echo "✅ All services stopped"
echo ""
