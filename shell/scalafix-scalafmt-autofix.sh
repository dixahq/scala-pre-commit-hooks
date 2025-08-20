#!/bin/bash

CMD="scala-cli format"
LIST_ARG="-F '--list'"
BETTER_ARGS=""
for word in $@
do
	BETTER_ARGS="${BETTER_ARGS} -F '$word'"
done

echo "Checking formatting..."
LIST_CMD="$CMD $LIST_ARG $BETTER_ARGS"
echo "$LIST_CMD"
FILES_TO_FORMAT=$(eval "$LIST_CMD")

FORMAT_CMD="$CMD $BETTER_ARGS"
echo "Formatting..."
echo "$FORMAT_CMD"
eval "$FORMAT_CMD"


echo "Staging files:"
echo $FILES_TO_FORMAT
if [ -n "${FILES_TO_FORMAT}" ]; then
	git add $FILES_TO_FORMAT
fi
