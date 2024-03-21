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

declare -g COMPONENTS=(
battery
game-pad-component
housing-component
mother-board-component
screen-component
usb-charger-component
)

# Pieces png generation
for piece in "${PIECES[@]}"; do
    echo "Pièce : $piece"
    openscad -o png_files/$piece.png pieces/$piece.scad
done

# compoenents png generation in preview folder
for component in "${COMPONENTS[@]}"; do
    echo "Pièce : $component"
    openscad -o png_files/previews/$component.png components/$component.scad
done

#main preview
openscad -o png_files/previews/main.png main.scad


