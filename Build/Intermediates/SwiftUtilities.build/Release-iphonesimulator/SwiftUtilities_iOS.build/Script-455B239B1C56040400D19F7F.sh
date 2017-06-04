#!/bin/sh
if test $CARTHAGE = "YES"; then
  exit 0
fi

if which swiftlint >/dev/null; then
  swiftlint lint --quiet
else
  echo "SwiftLint does not exist, download from https://github.com/realm/SwiftLint"
fi
