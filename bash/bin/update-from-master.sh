#!/bin/bash

PACKAGE=$1
MASTER_REPO="/etc/dotfiles"

if [ -z "$PACKAGE" ]; then
    echo "Usage: $0 <package>"
    echo "Example: $0 vim"
    exit 1
fi

if [ ! -d "$MASTER_REPO/$PACKAGE" ]; then
    echo "Error: Package '$PACKAGE' not found in $MASTER_REPO"
    exit 1
fi

if [ ! -d "$HOME/.dotfiles/$PACKAGE" ]; then
    echo "Error: Package '$PACKAGE' not found in ~/.dotfiles"
    echo "Available packages in ~/.dotfiles:"
    ls -1 "$HOME/.dotfiles" | grep -v "^\\."
    exit 1
fi

cd ~/.dotfiles

echo "Updating $PACKAGE from master..."

# Remove old package content (but keep the directory)
rm -rf "$PACKAGE"/*
rm -rf "$PACKAGE"/.??* 2>/dev/null || true

# Copy new content from master
cp -r "$MASTER_REPO/$PACKAGE"/. "$PACKAGE"/

# Show what changed
echo ""
echo "Changes:"
git diff "$PACKAGE" || echo "No changes detected"

echo ""
echo "If changes look good, commit them:"
echo "  git add $PACKAGE"
echo "  git commit -m 'Updated $PACKAGE from master template'"
echo "  stow -R $PACKAGE"
