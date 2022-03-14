#!/bin/bash

FILES_TO_FORMAT=$(scalafmt --list $@)

echo "Formatting..."
echo "scalafmt $@"
scalafmt $@

echo "Staging files:"
echo $FILES_TO_FORMAT
git add $FILES_TO_FORMAT
