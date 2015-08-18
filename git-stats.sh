#!/usr/bin/env sh

function usage () {
	echo "Usage: $0 path/to/git/repository"
}

if [ $# != 1 ]; then
	usage
	exit 1
fi


GIT_REPO=$1

cd $GIT_REPO

git shortlog -ns --no-merges | awk '{printf "%s:%s\n", $2, $1}' | asciigraph  -l "$1" --color
