#Spack
The included spack env dev-env within the spack dir of dotfiles when
installed will install neovim, stow, and tmux. Use GNU stow to load the
config files from this dir.

'''
chmod +x /Users/masonmccallum/dotfiles/spack/initdevenv.sh
./dotfiles/spack/initdevenv.sh
'''

## ADD to .bashrc or .zshrc
make sure to $stow bash or $stow zsh
also add the following to your .bashrc or .zshrc

'''
if [[ "$SHELL" == */bash ]]; then
    [ -f "$HOME/.bash_config" ] && source "$HOME/.bash_config"
elif [[ "$SHELL" == */zsh ]]; then
    [ -f "$HOME/.zsh_config" ] && source "$HOME/.zsh_config"
fi
'''

For julia setup neet to see the following
https://github.com/fredrikekre/.dotfiles/tree/master/.julia/environments/nvim-lspconfig
