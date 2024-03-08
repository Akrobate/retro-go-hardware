#!/bin/bash

declare -g PIECES=(
a-b-button-piece
controller-facade-piece
directional-cross-piece
facade-back-piece
facade-corner-piece
facade-front-piece
facade-left-piece
facade-top-piece
screen-frame-facade-piece
screen-frame-piece
screen-glass-piece
sdcard-holder-piece
small-button-piece
)

# Model generation
for piece in "${PIECES[@]}"; do
    echo "Pièce : $piece"
    openscad -o stl_files/$piece.stl pieces/$piece.scad
done