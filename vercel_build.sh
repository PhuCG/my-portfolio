#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT_DIR"

echo "Installing FVM (Flutter Version Management)..."

# Install FVM (standalone binary) — works in CI without preinstalled Dart/Flutter.
curl -fsSL https://fvm.app/install.sh | bash

# Add FVM to PATH for this build step.
export PATH="$HOME/fvm/default/bin:$HOME/fvm/bin:$PATH"

command -v fvm >/dev/null 2>&1 || {
  echo "FVM not found on PATH after installation."
  exit 1
}

echo "FVM version:"
fvm --version || true

echo "Installing Flutter version from .fvmrc..."
fvm install

echo "Flutter version (via FVM):"
fvm flutter --version

fvm flutter config --enable-web
fvm flutter pub get

# Build for web (release)
fvm flutter build web --release

echo "Build complete: $ROOT_DIR/build/web"

