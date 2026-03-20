#!/bin/bash

FILES_TO_FORMAT=$(scalafmt --list $@)

echo "Formatting..."
echo "scalafmt $@"
scalafmt $@

FILES_TO_STAGE=$(git diff --cached --name-only --diff-filter=d)
echo "Staging files:"
echo $FILES_TO_STAGE
if [ -n "${FILES_TO_STAGE}" ]; then
	git add $FILES_TO_STAGE
fi
