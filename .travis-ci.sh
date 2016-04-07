#!/bin/bash -
#===============================================================================
#
#          FILE: .travis-ci.sh
#
#         USAGE: ./.travis-ci.sh
#
#   DESCRIPTION: Generate the ml file and compile
#
#        AUTHOR: Danny Willems <contact@danny-willems.be>
#       CREATED: 04/06/2016 11:26
#      REVISION: 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

URL=https://github.com/dannywillems/ocaml-cordova-plugin-videoplayer.git
PLUGIN_PIN=cordova-plugin-videoplayer

export OPAMYES=1

if [ -f "$HOME/.opam/config" ]; then
    opam update
    opam upgrade
else
    opam init
fi

if [ -n "${OPAM_SWITCH}" ]; then
    opam switch ${OPAM_SWITCH}
fi
eval `opam config env`

export OCAMLRUNPARAM=b

# Test for make and make clean
make && make clean

# Test for make install and make remove
make install && make remove && make clean

# Test for the pin and -package. No real tests are done.
opam pin add ${PLUGIN_PIN} ${URL}
ocamlfind ocamlc -c -o test.cmo -package gen_js_api -package ${PLUGIN_PIN} -linkpkg test/test.ml
