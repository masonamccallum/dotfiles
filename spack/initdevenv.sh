if [ ! -d  ~/spack ]; then
    git clone https://github.com/spack/spack.git ~/spack
fi

cd ~/spack
. share/spack/setup-env.sh
cd ~
spack env create dev-env dotfiles/spack/dev-env/spack.yaml
spack env activate -p dev-env
spack concretize
spack install
