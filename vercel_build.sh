#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT_DIR"

# ── 1. Read Flutter version from .fvmrc ────────────────────────────────────
FLUTTER_VERSION="$(python3 -c "
import json
with open('.fvmrc') as f:
    print(json.load(f).get('flutter', 'stable'))
")"
echo "Flutter version: ${FLUTTER_VERSION}"

# ── 2. Download Flutter SDK from Google's official CDN ─────────────────────
FLUTTER_HOME="${ROOT_DIR}/.flutter_sdk"
export PATH="${FLUTTER_HOME}/bin:${PATH}"

if [[ ! -x "${FLUTTER_HOME}/bin/flutter" ]]; then
  ARCH="$(uname -m)"
  [[ "${ARCH}" == "aarch64" ]] && ARCH="arm64" || ARCH="x64"

  FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
  echo "Downloading Flutter SDK from: ${FLUTTER_URL}"

  curl -fSL "${FLUTTER_URL}" -o /tmp/flutter.tar.xz
  mkdir -p "${FLUTTER_HOME}"
  tar -xf /tmp/flutter.tar.xz --strip-components=1 -C "${FLUTTER_HOME}"
  rm -f /tmp/flutter.tar.xz
  echo "SDK extracted to ${FLUTTER_HOME}"
fi

# ── 3. Build ────────────────────────────────────────────────────────────────
flutter --version
flutter config --enable-web
flutter pub get
flutter build web --release

echo "Build complete: ${ROOT_DIR}/build/web"
