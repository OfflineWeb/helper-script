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
#set -n

if [[ $(node --version | grep -c "12\.") > 0 ]]; then
    echo "latest version of node is already installed"
else
    ## update packages
    brew upgrade

    ## uninstall old node js
    brew uninstall node

    ## install node js
    brew install node
fi

if [[ $(npm --version | grep -c "6\.") > 0 ]]; then
    echo "latest version of npm is already installed"
else
    echo "please check latest version of npm"
fi

if [[ -z $(which nvm) || $(nvm --version | grep -c "0\.35") > 0 ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
else
    echo "please check latest version of nvm"
fi

echo "----- we are here ----"
## verify
node --version
npm --version
nvm --version
