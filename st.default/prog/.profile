# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# set in ~/.bashrc for prog
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

#set initial PATH explicitly (or some one can make it insert the sbin's)
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games"
# for go
#export GOPATH=~/go
#PATH="$GOPATH/bin:/usr/local/go/bin:$PATH"
# set PATH so it includes oper's private bin if it exists
if [ -d "/usr2/oper/bin" ] ; then
    PATH="/usr2/oper/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
#and the FS
PATH="/usr2/st/bin:/usr2/fs/bin:$PATH"

export EDITOR=vim
export LESS=-XR
#export FS_CHECK_NTP=1
#export FS_DISPLAY_SERVER=on
export FC=f95
export FS_SERIAL_CLOCAL=1
export FS_TINFO_LIB=1
