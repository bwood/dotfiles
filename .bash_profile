# Python
# -tr sort by time an reverse it to get the newest at the end, otherwise 3.10 will come before 3.9.
PYTHON_VER=$(ls -1 -tr /Users/bwood/Library/Python |tail -1)
export PATH="/usr/local/opt/php@7.4/bin:/usr/local/bin/python3:$HOME/Library/Python/$PYTHON_VER/bin:$HOME/bin:$HOME/.emacs.d/bin:$HOME/.composer/vendor/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:$PATH"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export ISTDRUPAL_VCR_CASSETTE_PATH=/Users/bwood/code/drupal/istdrupal_ops/pantheon/tests/fixtures

# WPS Development
export WPS_VCR_CASSETTE_PATH="/Users/bwood/code/php/WpsConsole/tests/fixtures"
export WPS_BIN_DIR=builds
export WPSD_DEV_ROOT=$HOME/code/php/WpsConsole

# # istdrupal_ops development
export ISTDRUPAL_OPS_BIN_DIR=builds

export EDITOR="/usr/local/bin/emacs -q -nw"
export VISUAL="emacs -q -nw --no-splash"
export TERM="xterm-color"

#aliases
alias ll="ls -laFG"

##############
## Include other function files.
#############
. ~/code/dotfiles/dotfiles-wps/src/.bash_wps.sh
. ~/code/dotfiles/dotfiles-bwood/.bash_wps_bwood_mbp2019.sh
export AWS_PROFILE=bwood
. ~/code/dotfiles/dotfiles-bwood/.bash_aws.sh

# Allow php debugging from CLI
export XDEBUG_CONFIG="idekey=PHPSTORM"  

#########
## GIT##
#########
# bash-git-prompt
# https://github.com/magicmonty/bash-git-prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi
# Set config variables first
# GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_SHOW_UPSTREAM=1
#GIT_PROMPT_THEME=Evermeet
GIT_PROMPT_THEME=Custom
GIT_PROMPT_THEME_FILE=$HOME/.git-prompt-colors.sh

#git aliases
alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -v'
alias gcm='git commit -v -m'
alias gca='git commit -v -a'
alias gd='git diff --color'
alias gco='git checkout' #switch to different branch
alias gcob='git checkout -b' #create a new branch
alias gl='git pull'
alias gp='git push'
alias gb='git branch' #show branches
alias gbva='git branch -va' #show branches - verbose/all (incl remote)
alias gbd='git branch -d' #delete branch for cleanup
alias gbD='git branch -D' #abandon branch
# "git branch recent" show branches ordered by most recent commits.
alias gbr='for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r'
alias git-branch-recent=gbr
alias glg='git log'
alias glgp='git log --pretty=format:"%h - %an, %ar : %s"'
alias gi='git init'
alias gm='git merge'
alias gr='git remote -v'
alias grso='git remote show origin' #show remote-local tracking
alias gfup='git fetch upstream'
alias gst='git stash'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstd='git stash drop'
alias gstp='git stash pop' #apply stash and drop from stack (gsa + gsd)
alias git-latest-branch="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

#commit pending changes and quote all args as message
gg() {
  git commit -v -a -m "$*"
}

#git push to a specific origin branch; -u flag to set upstream
gpob() {
  if [ -z "$1" ]
  then
    echo "Needs one parameter: branch name"
  else
    git push -u origin $1
  fi
}

# unshallow a repo so that you can checkout remote branches
git-unshallow() {
  git fetch --unshallow
  git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
  git fetch origin
}
alias gu=git-unshallow


#alias codercs='phpcs --standard=/Users/bwood/.drush/coder/coder_sniffer/Drupal/ruleset.xml --extensions=php,module,inc,install,test,profile,theme'


# If you commonly get a gateway timeout when running 'terminus sites aliases',
# set this to "1" to avoid this problem. 
# export ISTDRUPAL_ALIAS_TIMEOUT=1 
 
# Docker
# Connect to an image
docker-connect () {
  docker run -it $1 bash -il
}
# "docker connect image" dci
alias dci=docker-connect

# Headless chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# by default sudo to bwood_admin
alias sudo='sudo -u la-bwood'

# brew: bash-completion
#[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[ -f "/usr/local/etc/bash_completion" ] && . "/usr/local/etc/bash_completion"

# Python3
alias pip=pip3
alias python=python3
export PYTHONPATH=/Users/bwood/Library/Python/$PYTHON_VERSION/lib/python/site-packages
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/Users/bwood/Library/Python/$PYTHON_VER/bin/virtualenv
# Avoid virtual environments.  Use docker.
#. /Users/bwood/Library/Python/$PYTHON_VER/bin/virtualenvwrapper.sh

# NVM Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# this should come last
# https://github.com/bamarni/symfony-console-autocomplete#prerequisites
# enable symfony console app command completion
# eval \"$(symfony-autocomplete)\"
source $(brew --prefix)/etc/bash_completion
source ~/.terminus-autocomplete

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Lando
export LANDO_SITES_DIR=$HOME/Sites/lando
