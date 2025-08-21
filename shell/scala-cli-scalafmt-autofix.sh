#!/bin/bash

CMD="scala-cli format -F --mode=changed"

echo "Formatting..."
echo "$CMD"
eval "$CMD"

FILES_TO_STAGE=$(git diff --cached --name-only)
echo "Staging files:"
echo $FILES_TO_STAGE
if [ -n "${FILES_TO_STAGE}" ]; then
	git add $FILES_TO_STAGE
fi
