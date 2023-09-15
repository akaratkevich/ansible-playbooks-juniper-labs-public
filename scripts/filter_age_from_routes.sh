#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Specify the directory containing the files
CAPTURES_DIR="$SCRIPT_DIR/../playbooks/captures"

# Use find to get a list of XML files
find "$CAPTURES_DIR" -type f -name '*.xml' -exec sh -c 'grep -v "<age seconds=.*</age>" "$0" > "${0%.xml}_tmp.xml"' {} \;

