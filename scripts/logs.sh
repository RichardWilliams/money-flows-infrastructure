#!/bin/bash

# Show logs from infrastructure services

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODESPACE_DIR="$(dirname "$SCRIPT_DIR")"

SERVICE=${1:-""}

cd "$CODESPACE_DIR"

if [ -z "$SERVICE" ]; then
    echo "📜 Showing logs for all services..."
    echo "   (Press Ctrl+C to exit)"
    echo ""
    docker-compose -f .devcontainer/docker-compose.yml logs -f
else
    echo "📜 Showing logs for $SERVICE..."
    echo "   (Press Ctrl+C to exit)"
    echo ""
    docker-compose -f .devcontainer/docker-compose.yml logs -f "$SERVICE"
fi
