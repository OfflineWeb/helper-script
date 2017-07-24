#!/bin/bash

#############################################################################
# The MIT License (MIT)                                                     #
#                                                                           #
# Copyright 2017 papa.                                                      #
#                                                                           #
# Permission is hereby granted, free of charge, to any person obtaining     #
# a copy of this software and associated documentation files  to deal       #
# (the “Software”), in the Software without restriction, including          #
# without limitation the rights to use, copy, modify, merge, publish,       #
# distribute, sublicense, and/or sell copies of the Software, and to permit #
# persons to whom the Software is furnished to do so, subject to the        #
# following conditions:                                                     #
#                                                                           #
# The above copyright notice and this permission notice shall be included   #
# in all copies or substantial portions of the Software.                    #
#                                                                           #
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS   #
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF                #
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.    #
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR          #
# ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,  #
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE         #
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                    #
#############################################################################

source ./colors.sh

echo -e $Yellow'\n********* Updating git repos **********\n'$Color_Off

GIT_NOT_MODIFIED_STATUS='nothing to commit, working directory clean'

work_dir=$(pwd)					# current directory
base_dir=$(dirname $work_dir)	# parent of current directory

# If the git repo in the sub-directory is updated, then commit, 
# ask for a comment for git commit
for dir in $(ls -1 $base_dir); do

	if [[ ! -d "$base_dir/$dir/.git" ]]; then
		cd "$base_dir/$dir"

		echo -ne $Green"$dir : initializing git :: "$Color_Off
		git init
		git remote add origin "git@github.com:OfflineWeb/$dir.git"
		cp "$work_dir/.gitignore" .
		cp "$work_dir/LICENSE" .
		touch README.md
		echo "Placehoder for $dir" >> README.md

		cd "$base_dir"
	fi
done
