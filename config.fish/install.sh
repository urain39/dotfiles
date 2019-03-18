#!/usr/bin/env sh

HERE=$PWD

mkdir -p ~/.config/fish/conf.d
ln -sf $HERE/config.fish ~/.config/fish/conf.d/config.fish

