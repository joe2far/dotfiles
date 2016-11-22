### Aliases ###

### General ####
alias s='source ~/.bashrc'              # source .bashrc
alias _="sudo"                          # sudo shortcut
alias suod='sudo'                       # sudo typo
alias sl='ls'                           # ls typo
alias l='ls'                            # various 'ls' shortcuts 
alias la='ls -lia'                      
alias ll='ls -lrt'                      
alias l1='ls -1'                        
alias c='clear'                         # clear  
alias q='exit'                          # exit 
alias .='nautilus . &'                  # open files
alias ..='cd ..'                        # various 'cd' shortcuts
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias -- -='cd -'
alias h='history'                        # history
hu(){
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | less
}

hu2(){
  history | awk '{CMD[$2"_"$3"_"$4]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | less
}
alias most-used='hu'                     # most used commands
alias most-used2='hu2'                   # most used complete commands
alias md='mkdir -p'                      # make a directory
alias rd='rmdir'                         # remove a direcory
alias zw='cd ${WORKSPACE}'               # switch to workspace
alias workspace='echo ${WORKSPACE}'      # echo workspace
alias where='which'                      # common mistake
alias path='echo $PATH | tr -s ":" "\n"' # pretty print the PATH
alias hosts='sudo vim /etc/hosts'        # open hosts

### VIM ###
alias v='vim'
alias vi='vim'
alias vime='vim src/*extension/*extension.py'
alias vimp='vim src/*plugin/*plugin.py'
alias vimt='vim $(find test/ -name test*.py)'
alias vim-ssh-hosts='vim ~/.ssh/known_hosts'
alias vim-bashrc='vim ~/.bashrc'
alias vim-bash-profile='vim ~/.bash_profile'
alias vim-bash-prompt='vim ~/.bash_prompt'
alias vim-bash-aliases='vim ~/.bash_aliases'
alias vim-bash-functions='vim ~/.bash_functions'
alias vim-bash-exports='vim ~/.bash_exports'


### GIT ###
alias g='git'
alias ga='git add'
alias gall='git add .'
alias gam='git commit --amend'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gci='git commit --interactive'
alias gcl='git clone'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdel='git branch -D'
alias gdv='git diff -w "$@" | vim -R -'
alias get='git'
alias gexport='git archive --format zip --output'
alias gl='git pull'
alias gll='git log --graph --abbrev-commit'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gup='git fetch upstream && git rebase upstream/master'
alias gp='git push'
alias gpo='git push origin'
alias gprune='git remote prune origin'
alias grhead='git reset HEAD'
alias gs='git status'
alias gss='git status -s'
alias gst='git status'
alias gti='git'
alias gundo='git reset --soft HEAD^'
alias gf="git fetch"
alias gfu="git fetch upstream"
alias grh="git reset --hard origin/master"
alias glo="git pull origin"
alias gm="git merge"
alias gms="git merge --squash"
alias gresetauthor='git commit --amend --reset-author'
alias gmerged='git branch --merged | grep -v master'
alias gpatch-create="git format-patch -1"
alias gpatch-apply="git apply"
function gclone_workspace(){
  cd ${WORKSPACE}
  gclone $1
}
function git-recursive(){
  cd ${WORKSPACE}
  for i in $(ls -d */); do
    echo $i
    cd $i
    git $1
    cd ..
  done
}

### GERRIT ###
alias review='git push origin HEAD:refs/for/master' # Gerrit review

### DOCKER ###
if ! [ -f /.dockerinit ]; then
    alias docker='docker'
    alias dk-lc='docker ps -l'       # List last Docker container
    alias dk-lc-id='docker ps -l -q' # List last Docker container ID
    alias dk-kill='docker kill'
    # Get Docker container IP
    alias dk-ip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
    # Get IP of last Docker container
    alias dk-lc-ip="docker inspect ${dk-lc-id} | grep IPAddress | cut -d '\"' -f 4"
    # Kill last Docker container
    alias dk-kill-lc="docker ps -l -q | xargs sudo docker kill"
    alias dk-ps='docker ps'           # List running Docker containers
    alias dk-psa=' docker ps -a'      # List all Docker containers
    alias dk-images='docker images'   # List Docker images
    alias dk-rmi='docker rmi'         # Remove Docker image
    alias dk-rm-all-images="sudo docker images | grep \"<none>\" | awk '{print \$3}' | xargs sudo docker rmi"
    # Remove all Docker containers
    alias dk-rm-all-conts="sudo docker ps -a | awk '{print \$1}' | grep -v CONT | xargs --no-run-if-empty sudo docker rm -f"
fi

### KUBERNETES ###
alias kc="kubectl"
alias kcs="kubectl --namespace='kube-system'"

### PYTHON ###
alias py="python"
alias ipy="ipython"
alias grepy="find . -type f -iname '*.py' | grep -v target | xargs grep -TnZ"
alias gogrep="find . -type f -iname '*.go' | xargs grep -TnZ"
alias nose-trace="echo 'from nose.tools import set_trace; set_trace()'"
alias pdb="echo 'import pdb; pdb.set_trace()'"
alias ipdb="echo 'import ipdb; ipdb.set_trace()'"
alias epp='echo $PYTHONPATH'
alias pp='export PYTHONPATH=`PWD`/src/:`PWD`/test/'
alias pyt='pythoscope --init; pythoscope *.py'
spp(){
  export PYTHONPATH=$1
  echo ${PYTHONPATH}
}
add-to-pp(){
  export PYTHONPATH=$PYTHONPATH:$1;
}

### MAVEN ###
alias mnv='mvn'
alias mvn-pep8='mvn org.codehaus.mojo:maven-exec-plugin:pep8'
alias mvn-pylint='mvn org.codehaus.mojo:maven-exec-plugin:pylint'
alias mvn-nose='mvn org.codehaus.mojo:maven-exec-plugin:nosetests'
alias mvnt='mvn test'
alias mvnc='mvn clean'
alias mvni='mvn install'
alias mvnci='mvn clean install'
alias mvncild='mvn clean install -P latest-dep'
alias mvnic='mvn clean install'
alias mvnp='mvn package'
alias mci='mvn clean install'
alias mi='mvn install'
alias mrprep='mvn release:prepare'
alias mrperf='mvn release:perform'
alias mrrb='mvn release:rollback'
alias mdep='mvn dependency:tree'
alias mpom='mvn help:effective-pom'
alias mcisk='mci -Dmaven.test.skip=true'
