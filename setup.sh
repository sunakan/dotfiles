#!/bin/sh

#=======================================================
# sshrc
# sshrc_commandとしているのはファイル名が被っているから
#=======================================================
if ! [ -e /usr/local/bin/sshrc ]; then
  wget https://raw.githubusercontent.com/Russell91/sshrc/master/sshrc -O sshrc_command &&
    chmod +x sshrc_command &&
    sudo mv sshrc_command /usr/local/bin/sshrc
fi
if ! [ -e ~/.sshrc.d ]; then
  mkdir ~/.sshrc.d
fi
ln -sf `pwd`/sshrc ~/.sshrc
ln -sf `pwd`/vimrc ~/.sshrc.d/.vimrc
ln -sf `pwd`/tmux.conf ~/.sshrc.d/.tmux.conf

#=======================================================
# link
#=======================================================
ln -sf `pwd`/vimrc ~/.vimrc
ln -sf `pwd`/tmux.conf ~/.tmux.conf
ln -sf `pwd`/dircolors ~/.dircolors
#ln -sf `pwd`/ansible.cfg ~/.ansible.cfg
#ln -sf `pwd`/bash_profile ~/.bash_profile

#=======================================================
# vimのプラグイン管理
#=======================================================
if ! [ -e ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
