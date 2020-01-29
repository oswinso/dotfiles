ESSENTIALS="git zsh build-essential"
sudo apt update && \
sudo apt install -y $ESSENTIALS && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
stow zsh
stow vimrc
