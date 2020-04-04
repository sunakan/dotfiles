#!/bin/bash
#=======================================================
# ./setup4wsl.sh
#=======================================================

#=======================================================
# パッケージ
#=======================================================
echo "=====[ Install common packages ]"
sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list
sudo apt update \
  && sudo apt install -y vim tree make git tig wget tmux

#=======================================================
# link
#=======================================================
echo "=====[ Setup ln ]"
ln -sf ${PWD}/dircolors ~/.dircolors
ln -sf ${PWD}/vimrc ~/.vimrc
ln -sf ${PWD}/tmux.conf ~/.tmux.conf
ln -sf ${PWD}/dircolors ~/.dircolors

#=======================================================
# kyrat(sshのラッパ、sshrcは消えてしまった...)
#=======================================================
echo "=====[ Setup kyrat ]"
readonly KYRAT_DIR=${HOME}/.local/share/kyrat
if [ ! -d "${KYRAT_DIR}" ] ; then
    git clone https://github.com/fsquillace/kyrat ${KYRAT_DIR}
fi
grep --line-number 'kyrat' ~/.bashrc || echo export 'PATH=$PATH:~/.local/share/kyrat/bin' >> ~/.bashrc
ln -sf ${PWD}/kyrat_bashrc ${HOME}/.config/kyrat/bashrc.d/
ln -sf ${PWD}/tmux.conf ${HOME}/.config/kyrat/tmux.conf.d/
ln -sf ${PWD}/vimrc ${HOME}/.config/kyrat/vimrc.d/

#=======================================================
# その他
#=======================================================
echo "=====[ Setup bashrc ]"
grep --line-number 'EDITOR="vim"' ~/.bashrc || echo export EDITOR=\"vim\" >> ~/.bashrc
git config --global user.name "sunakan"
git config --global user.email "sunakan03@gmail.com"
git config --global core.editor vim
