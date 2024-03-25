#!/bin/bash

declare -g PIECES=(
a-b-button-piece
bolt-join-game-pad-piece
bolt-join-mother-board-piece
controller-facade-piece
directional-cross-piece
facade-back-piece
facade-bottom-piece
facade-corner-piece
facade-front-piece
facade-left-piece
facade-top-piece
screen-frame-facade-piece
screen-frame-piece
screen-glass-piece
sdcard-holder-piece
small-button-piece
speaker-facade-piece
usb-charger-facade-holder-piece
usb-charger-fixation-piece
)

# Model generation
for piece in "${PIECES[@]}"; do
    echo "Pièce : $piece"
    openscad -o stl_files/$piece.stl pieces/$piece.scad
done