#!/bin/bash

XCODE_USER_TEMPLATES_DIR="${HOME}/Library/Developer/Xcode/Templates/File Templates"
XCODE_USER_SNIPPETS_DIR="${HOME}/Library/Developer/Xcode/UserData/CodeSnippets"

TEMPLATES_DIR="T21"

echo "Search for directory: $XCODE_USER_TEMPLATES_DIR"

mkdir -p "$XCODE_USER_TEMPLATES_DIR"

if [ -d "${XCODE_USER_TEMPLATES_DIR}/${TEMPLATES_DIR}" ]; then
	echo "Directory already exists."
	rm -rf "${XCODE_USER_TEMPLATES_DIR}/${TEMPLATES_DIR}"
else
	echo "Directory does not exists."
fi

cp -r "${TEMPLATES_DIR}" "$XCODE_USER_TEMPLATES_DIR"

echo "Installation completed."