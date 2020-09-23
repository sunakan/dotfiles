#!/bin/sh

################################################################################
# パッケージ
################################################################################
setup_packages() {
  echo "=====[ Install common packages ]"
  sudo apt update --assume-yes
  sudo apt install --assume-yes \
    vim \
    tree \
    make \
    git \
    tig \
    tmux \
    clang
}

################################################################################
# Rust
################################################################################
setup_rust() {
  echo "=====[ Install rustup ]"
  curl https://sh.rustup.rs -sSf | sh
  rustup update
}


################################################################################
# link
################################################################################
setup_links() {
  echo "=====[ Setup ln ]"
  ln -sf ${PWD}/conf.d/dircolors ~/.dircolors
  ln -sf ${PWD}/conf.d/vimrc ~/.vimrc
  ln -sf ${PWD}/conf.d/tmux.conf ~/.tmux.conf
  ln -sf ${PWD}/conf.d/dircolors ~/.dircolors
}

################################################################################
# kyrat(sshのラッパ、sshrcは消えてしまった...)
################################################################################
#echo "=====[ Setup kyrat ]"
#readonly KYRAT_DIR=${HOME}/.local/share/kyrat
#if [ ! -d "${KYRAT_DIR}" ] ; then
#    git clone https://github.com/fsquillace/kyrat ${KYRAT_DIR}
#fi
#grep --line-number 'kyrat' ~/.bashrc || echo export 'PATH=$PATH:~/.local/share/kyrat/bin' >> ~/.bashrc
#ln -sf ${PWD}/kyrat_bashrc ${HOME}/.config/kyrat/bashrc.d/
#ln -sf ${PWD}/tmux.conf ${HOME}/.config/kyrat/tmux.conf.d/
#ln -sf ${PWD}/vimrc ${HOME}/.config/kyrat/vimrc.d/

################################################################################
# GitConfig
################################################################################
setup_gitconfig() {
  echo "=====[ Setup git config]"
  grep --line-number 'EDITOR="vim"' ~/.bashrc || echo export EDITOR=\"vim\" >> ~/.bashrc
  git config --global user.name "sunakan"
  git config --global user.email "sunakan03@gmail.com"
  git config --global core.editor vim
}

#setup_packages
setup_links
setup_gitconfig
setup_rust
