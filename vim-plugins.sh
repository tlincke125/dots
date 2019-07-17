#!/bin/bash


booleans=(wildmenu ignorecase smartcase cindent nostartofline confirm number visualbell)

desc=("command line completion" "ignores case in search" "ignore case in search unless you specifically use capital letters" "Auto indent that bitch" "Stop from going to the start of the line on certain movements" "Instead of an error wwhen you quit without saving, it asks you if you would like to fix your error you cheeky bastard" "sexy numbers on the side of your screen" "visual bell instead of audio if you do something wrong")

keys=(shiftwidth softabstop t_Co background laststatus)

desc2=("width of a tab in spaces [ 2 4 or 3 if you want to die with no friends]" "best to set the same as previous" "colors - use 256" "background color [dark light]" "I forget what this means, I did 2")

vim_plugins=("wikitopian/hardmode" "aperezdc/vim-template" "scroolose/nerdtree" "terryma/vim-multiple-cursors" "haya14busa/incsearch.vim" "airblade/vim-gitgutter")


show_help () {
  printf "

  theo's mighty vim git plugins

  Usage:

    Install plugins
        ./vim-plugin -v -c

    Configure your vimrc
        ./vim-plugin -v --config

    Configure your vimrc by testing it loclaly first
        ./vim-plugin --config --dryrun ./test

    Note - you must include either --config or -c/d
    
    vim-plugins [OPTIONS]

    OPTIONS

    -h --help           Show this help menu
    -d --default        Install all plugins without being asked permission
    -v --verbose        Install plugins with pzaz (verbose output)
    -c --chose          Install only the plugins you want
    --config            Configure your vimrc as well
    --dryrun [File]     Create an example vimrc in this directory with the 
        
    \n"
}


print_config () {
  printf '
 ___________________ 
< configuring vimrc >
 ------------------- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
You will be asked a bunch of questions
answer them honestly or you will be punished
for the first half, type n or d for default values
and y for set active

For the second half, type d for default or enter an option to
configure'
  echo ""
}

print_plugin () {
  printf '
 ________________________ 
< Installing Vim Plugins >
 ------------------------ 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

You will be asked or not depending on your
option whether you would like to install a vim
plugin.

Note that I will automatically configure
pathogen because pathogen is the only
manager that should be used. Be sure to back
up your files'
echo ""
}



vim_config () {
  print_config
  for i in ${!booleans[*]}; do
    printf "\nOption: %s\n" "${booleans[$i]}"
    printf "Description:\n%s\n\n%s\n" "${desc[$i]}" "[y/N/d]"
    read -r temp
    if [ "$temp" == "d" ] || [ "$temp" == "D" ]; then
      printf "\nI pulled a little sneaky sneak on you, d does the same thing as n\n"
    fi
    if [ "$temp" == "y" ] || [ "$temp" == "Y" ]; then
      printf "\nset ${booleans[$i]}\n" >> "$1"
    fi
  done

  for j in ${!keys[*]}; do
    printf "\nOption: %s" "${keys[$j]}"
    printf "\nDescription:\n%s\n\n>> " "${desc2[$j]}"
    read -r temp
    printf "\nset ${keys[$j]}=$temp\n" >> "$1"
  done 
  printf "\nDone configuring vim. Most likely your vimrc is now a cluster fuck so it 
  is advisable to go and fix the format, make things look pretty\n"
}

setup_pathogen () {
  if [ ! -f "$HOME/.vim/autoload" ]; then
    mkdir -p "$HOME/.vim/autoload $HOME/.vim/bundle"
  fi # Assume they have both
  curl -LSso "$HOME/.vim/autoload/pathogen.vim" "https://tpo.pe/pathogen.vim"
  if [ -f "$HOME/.vimrc" ]; then
    cp "$HOME/.vimrc" "$HOME/.vimrc.copy"
  fi
  echo "# Auto generated .vimrc, if you had a .vimrc, it is now located at .vimrc.copy" > "$HOME/.vimrc"
  printf "execute pathogen#infect()\nsyntax on\nfiletype plugin indent on\n" > "$HOME/.vimrc"
}

install_plugs () {
  print_plugin
  setup_pathogen
  printf "\nInstalling vim plugins\n"
  pushd "$HOME/.vim/bundle"
  for i in ${vim_plugins[*]}; do
    if [ "$2" == "verbose" ]; then
      printf "\nInstalling plugin %s\n" "$i"
    fi
    if [ "$1" == "ask" ]; then
      printf "proceed? [Y/n]\n"
      read -r temp
      if [ "$temp" == "y" ] || [ "$temp" == "Y" ]; then
        if [ "$2" == "verbose" ]; then
          git clone "https://github.com/$i.git"
        else
          git clone "https://github.com/$i.git" --quiet
        fi
      fi
    else
      if [ "$2" == "verbose" ]; then
        git clone "https://github.com/$i.git"
      else
        git clone "https://github.com/$i.git" --quiet
      fi
    fi
  done
  popd
}

INSTALL_VIM_PLUGINS="NOPE"

VERBOSITY="NOPE"
DEFAULT="NOPE"
DRYRUN="NADA"
DRYRUNFILE="$HOME/.vimrc"
VIMRC="NA"

if (( $# == 0 )); then
  show_help 
  exit 1
fi


while test $# -gt 0; do
  case "$1" in
    -h | --help)
      show_help
      exit 0
      ;;
    -d | --default)
      echo "Using default plugins - not asking permission, only forgiveness"
      echo ""
      DEFAULT="true"
      INSTALL_VIM_PLUGINS="true"
      shift
      ;;
    -v | --verbose)
      echo "being extra verbose"
      echo ""
      VERBOSITY="verbose"
      shift
      ;;
    -c | --choose)
      echo "Asking politely before installing plugins"
      echo ""
      DEFAULT="ask"
      INSTALL_VIM_PLUGINS="true"
      shift
      ;;
    --config )
      echo "Configuring vimrc"
      VIMRC="true"
      shift
      ;;
    --dryrun )
      echo "Using a dryrun"
      shift
      if test $# -gt 0; then
        DRYRUNFILE="$1"
      else
        echo "Didn't provide a dryrun file"
        exit 1
      fi
      shift
      ;;
  esac
done

if [ "$INSTALL_VIM_PLUGINS" == "true" ]; then
  install_plugs "$DEFAULT" "$VERBOSITY"
fi

if [ "$VIMRC" == "true" ]; then
  echo "$DRYRUNFILE"
  vim_config "$DRYRUNFILE"
fi
