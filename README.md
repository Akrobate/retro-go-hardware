# retro-go-hardware

## Hardware for the RetroGo (ducalex)

Software for this hardware
https://github.com/Akrobate/retro-go

This is a fork of 
https://github.com/ducalex/retro-go

To be sure to have the most adapted version for now for this hardware use https://github.com/Akrobate/retro-go, but most recent version of firmware is on https://github.com/ducalex/retro-go. The author accepted my important updates so this harware should perfectly work with the original code.


## Construction log

You can see my [construction log](construction-log/README.md) with real device photos and steps


## Pieces for project

[List of all electronic and not electronics parts](electronic/README.md)


## Generate png previews

```bash
./generate_png_files.sh
```

Output files will be stored in `./png_files/`


## Generate png previews

```bash
./generate_stl_files.sh
```

Output files will be stored in `./stl_files/`

## Configurations

You can configure all projects params from `configurations/global.scad`.


## Main project

![RetroGoHarware main preview](png_files/main.png)

## Components

![Gamepad controller](png_files/components/game-pad-component.png)
![Screen](png_files/components/screen-component.png)
![Mother board component](png_files/components/mother-board-component.png)
![USB Charger](png_files/components/usb-charger-component.png)
![Housing](png_files/components/housing-component.png)
![Battery](png_files/components/battery.png)

## Pieces

### Housing
![facade-front-piece.scad](png_files/pieces/facade-front-piece.png)
![facade-back-piece.scad](png_files/pieces/facade-back-piece.png)
![facade-top-piece.scad](png_files/pieces/facade-top-piece.png)
![facade-bottom-piece.scad](png_files/pieces/facade-bottom-piece.png)
![facade-left-piece.scad](png_files/pieces/facade-left-piece.png)
![facade-corner-piece.scad](png_files/pieces/facade-corner-piece.png)

### Gamepad controller
![controller-facade-piece.scad](png_files/pieces/controller-facade-piece.png)
![directional-cross-piece.scad](png_files/pieces/directional-cross-piece.png)
![small-button-piece.scad](png_files/pieces/small-button-piece.png)
![a-b-button-piece.scad](png_files/pieces/a-b-button-piece.png)
![bolt-join-game-pad-piece.scad](png_files/pieces/bolt-join-game-pad-piece.png)

### Screen
![screen-frame-facade-piece.scad](png_files/pieces/screen-frame-facade-piece.png)
![screen-frame-piece.scad](png_files/pieces/screen-frame-piece.png)
![screen-glass-piece.scad](png_files/pieces/screen-glass-piece.png)

### Speaker
![speaker-facade-piece.scad](png_files/pieces/speaker-facade-piece.png)

### USB Charger
![usb-charger-facade-holder-piece.scad](png_files/pieces/usb-charger-facade-holder-piece.png)
![usb-charger-fixation-piece.scad](png_files/pieces/usb-charger-fixation-piece.png)

### Mother board

Mother board positionning components

![Mother board positionning](png_files/assets/braidbaord-throws-components.png)

Mother bard fixation throws

![bolt-join-mother-board-piece.scad](png_files/pieces/bolt-join-mother-board-piece.png)
