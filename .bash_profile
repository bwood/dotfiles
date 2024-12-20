export PATH="/opt/homebrew:/usr/local/opt/php@8.0/bin:/usr/local/bin/python3:$HOME/bin:$HOME/.emacs.d/bin:$HOME/.composer/vendor/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:$HOME/.cargo/bin:$PATH"

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

export AWS_PROFILE=bwood
##############
## Include other function files.
#############
. $HOME/.bash_wps.sh
. $HOME/code/dotfiles/dotfiles-bwood/.bash_aws.sh
. $HOME/.dotfiles-wps/src/.bash_wps.sh
# Allow php debugging from CLI
export XDEBUG_CONFIG="idekey=PHPSTORM"  

#########
## GIT##
#########
# Git prompt
if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
  source "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh"
fi

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

# Manage dotfiles.  See https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html and deft.
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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

# homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

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

# Quiet MacOS's zsh message!
export BASH_SILENCE_DEPRECATION_WARNING=1

# Configure current shell for Rust.
. "$HOME/.cargo/env"
