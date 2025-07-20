#Spack
The included spack env dev-env within the spack dir of dotfiles when
installed will install neovim, stow, and tmux. Use GNU stow to load the
config files from this dir.

'''
git clone https://github.com/spack/spack.git ~/spack
cd ~/spack
. share/spack/setup-env.sh
mkdir -p ~/dev-env
cp ~/dotfiles/spack/dev-env/spack.yaml ~/dev-env
'''
