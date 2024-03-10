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
    openscad -o png_files/$piece.png pieces/$piece.scad
done

# Assets preview renders
openscad -o png_files/previews/screen-component.png components/screen-component.scad
openscad -o png_files/previews/game-pad-component.png components/game-pad-component.scad
# mother board
# usb charger holder

#main preview
openscad -o png_files/previews/main.png main.scad
