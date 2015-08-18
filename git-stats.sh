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

colon_separated_shortlog=$(echo "$shortlog" | awk '{
	for (i = 2; i <= NF; i++) {
		printf "%s", $i
		if (i != NF) printf " "
	}
	printf ":%s\n", $1
}')

echo "$colon_separated_shortlog" | asciigraph  -l 'Commit count' --color


contributors=$(echo "$colon_separated_shortlog" | cut -d: -f 1)

for name in $contributors; do
	colon_separated_commit_word_count+=$name:$(git log --pretty='format:%B' --no-merges --author="$name" | wc -w | tr -d '[[:space:]]')$'\n'
done

echo -n "$colon_separated_commit_word_count" | asciigraph -l 'Commit message word count' --color --sort=dec
