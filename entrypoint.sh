#!/bin/sh
if [[ -z "${VERSION}" ]]; then
  if [ "$GITHUB_EVENT_NAME" = "push" ]; then
    if [ "$GITHUB_REF_TYPE" = "branch" ]; then
        VERSION="dev-$GITHUB_REF_NAME"
    elif [ "$GITHUB_REF_TYPE" = "tag" ]; then
        VERSION="$GITHUB_REF_NAME"
    else
        echo "If 'version' is not set, only tag and branch ref types are supported."
        exit 1
    fi
  else
    echo "If 'version' is not set, only push actions are supported."
    exit 1
  fi
fi

echo "Publishing version $VERSION..."
cd /github/workspace/"${PACKAGE_PATH}"

exec "$@" "--version=$VERSION"
