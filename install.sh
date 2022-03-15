#!/bin/bash

set -e # Bail out on error

if [ -z "$HOME" ]; then
	echo "HOME env variable is not set, bailing out"
	exit 1
fi

BASHARK="${HOME}/.bashark"

# Copy source
mkdir -p "${BASHARK}"
cp source/* "${BASHARK}"

echo "Installation complete"
echo "The examples directory is a good place to start."