#!/data/data/com.termux/files/usr/bin/sh
# setup-container.sh — Helper to quickly initialize a pristine rootfs container
# Usage: setup-container.sh <glibc|musl>

set -e

CONTAINERS_DIR="$HOME/Library/Containers"
mkdir -p "$CONTAINERS_DIR"

case "$1" in
    glibc)
        TARGET="$CONTAINERS_DIR/gnu-aarch64"
        echo "==> Setting up glibc container at $TARGET..."
        mkdir -p "$TARGET"
        # If user has an existing glibc tree in usr/glibc, offer to link or extract
        if [ -d "/data/data/com.termux/files/usr/glibc" ]; then
            echo "Found existing glibc installation in /usr/glibc."
            echo "You can rsync or untar a pristine Debian rootfs into $TARGET"
        fi
        ;;
    musl)
        TARGET="$CONTAINERS_DIR/musl-aarch64"
        echo "==> Setting up musl container at $TARGET..."
        mkdir -p "$TARGET"
        echo "Download pristine Alpine Mini RootFS: https://alpinelinux.org/downloads/"
        echo "Extract with: tar -xpf alpine-minirootfs-*.tar.gz -C $TARGET"
        ;;
    *)
        echo "Usage: $0 <glibc|musl>"
        exit 1
        ;;
esac
