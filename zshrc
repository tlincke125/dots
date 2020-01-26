# Oh my zsh installation
export ZSH="/home/theo/.oh-my-zsh"

# Theme for zsh
ZSH_THEME="sunrise"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='vim'


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"

# alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
alias senti="cd /home/theo/dev/curmc/sentinet_cpp"
alias sentim="cd /home/theo/dev/curmc/sentinet_message_pkg"
alias sentipy="cd /home/theo/dev/curmc/sentinet_py"
alias ros="cd /home/theo/dev/curmc/ros/src/kermit"

source ~/.rvm/scripts/rvm

export PATH="/home/theo/.mozbuild/git-cinnabar:$PATH"
export PATH="/opt/sentinet_cpp/core/bin:$PATH"

export _JAVA_AWT_WM_NONREPARENTING=1

alias catkin_make="catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so"

alias open=evince
source "/home/theo/.tmux/.tmuxinator.zsh"
alias matlab="/home/MATLAB/R2019B/bin/matlab -nodisplay"
export ROS_WORKSPACE="/home/theo/dev/curmc/ros"

source /opt/ros/melodic/setup.zsh
source /home/theo/dev/curmc/ros/devel/setup.zsh

# alias tmux="TERM=screen-256color-bce tmux"
# [ $TERM != "screen" ] && exec tmux
# [ -z "$TMUX" ] && command -v tmux > /dev/null && TERM=xterm-256color && exec tmux

# tmux attach &> /dev/null

# if [[ ! $TERM =~ screen ]]; then
#     exec tmux new -s session1
# fi
