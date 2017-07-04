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

Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

echo -e $Yellow'\n********* Updating git repos **********\n'$Color_Off

GIT_MODIFIED_STATUS='Changes to be committed:'

work_dir=$(pwd)					# current directory
base_dir=$(dirname $work_dir)	# parent of current directory

# If the git repo in the sub-directory is updated, then commit, 
# ask for a comment for git commit
for dir in $(ls -1 $base_dir); do

	if [[ -d "$base_dir/$dir" ]]; then
		cd "$base_dir/$dir"

		# find git repo status, output == 1 means something updated
		git_status=$(git status | grep -c "$GIT_MODIFIED_STATUS")
		if [[ "$git_status" == '1'   ]]; then
			
			# prompt for a comment for commit,  
			echo -ne $Green"$dir : git comment :: "$Color_Off
			read comment			
			if [[ -z "${comment// }" ]]; then
				comment='Updated'
			fi

			# update git repo
			git add .
			git commit -am "$comment"
			git pull origin master
			git push origin master
		fi
		cd "$base_dir"
	fi
done