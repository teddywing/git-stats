git-stats
=========

A small Bash script that outputs graphs of contributor statistics for a given
Git repository.

Uses [py-ascii-graph](https://github.com/kakwa/py-ascii-graph) to create the
graphs.

Three graphs are generated:

1. Commit count
2. Commit word count
3. Days since first commit

Depending on the size of your repository, the last 2 will likely take a while
to complete.

Here's an example from this repository:

	$ git-stats.sh git-stats
	
	Commit count
	###############################################################################
	████████████████████████████████████████████████████████████   11.0  Teddy Wing
	Commit message word count
	###############################################################################
	████████████████████████████████████████████████████████████  369.0  Teddy Wing
	Days since first commit
	###############################################################################
	███████████████████████████████████████████████████████████    56.0  Teddy Wing


## License
Licensed under the MIT license. See the included LICENSE file.
