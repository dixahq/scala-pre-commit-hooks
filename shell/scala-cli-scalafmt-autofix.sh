#!/bin/bash

CMD="scala-cli format"
BETTER_ARGS=""
for word in $@
do
	BETTER_ARGS="${BETTER_ARGS} -F '$word'"
done

FORMAT_CMD="$CMD $BETTER_ARGS"
echo "Formatting..."
echo "$FORMAT_CMD"
eval "$FORMAT_CMD"

FILES_TO_STAGE=$(git diff --cached --name-only)
echo "Staging files:"
echo $FILES_TO_STAGE
if [ -n "${FILES_TO_STAGE}" ]; then
	git add $FILES_TO_STAGE
fi
