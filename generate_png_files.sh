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
    openscad --colorscheme="BeforeDawn" --view="axes,scales" -o png_files/pieces/$piece.png pieces/$piece.scad
done

# compoenents png generation in preview folder
for component in "${COMPONENTS[@]}"; do
    echo "Pièce : $component"
    openscad --colorscheme="BeforeDawn" -o png_files/components/$component.png components/$component.scad
done

#main preview
openscad --colorscheme="BeforeDawn" -o png_files/main.png main.scad


