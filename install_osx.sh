#!/bin/bash

set -euox pipefail

brew install bubblewrap curl

curl -fsSL https://opam.ocaml.org/install.sh > install_opam.sh
chmod +x install_opam.sh
./install_opam.sh --download-only
mv opam-* ./opam
chmod +x opam

./opam init --disable-sandboxing
./opam update --all
./opam switch create 5.2.0+ox --repos ox=git+https://github.com/oxcaml/opam-repository.git,default
eval $(./opam env --switch 5.2.0+ox)
./opam install -y ocamlformat merlin ocaml-lsp-server
