#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./home.nix
popd
