#!/bin/bash
set -euox pipefail

curl -fsSL https://opam.ocaml.org/install.sh > install_opam.sh
chmod +x install_opam.sh
./install_opam.sh --download-only
mv opam-* ./opam
chmod +x opam

./opam init --disable-sandboxing
./opam update --all
./opam switch create 5.2.0+ox --repos ox=git+https://github.com/oxcaml/opam-repository.git,default
eval $(./opam env --switch 5.2.0+ox)

./opam install -y \
    dune ocamlformat merlin ocaml-lsp-server \
    core core_kernel async_js \
    bonsai bonsai_web bonsai_web_components \
    js_of_ocaml ppx_html ppx_css

