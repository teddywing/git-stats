#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

function usage () {
	echo "Usage: $0 path/to/git/repository"
}

if [ $# != 1 ]; then
	usage
	exit 1
fi


GIT_REPO=$1

cd $GIT_REPO

shortlog=$(git shortlog -ns --no-merges)

echo "$shortlog" | awk '{
	for (i = 2; i <= NF; i++) {
		printf "%s", $i
		if (i != NF) printf " "
	}
	printf ":%s\n", $1
}' | asciigraph  -l "Commit count" --color
