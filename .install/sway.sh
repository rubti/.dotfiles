#!/bin/bash

sudo apt-get install --assume-yes \
    brightnessctl playerctl pulseaudio-utils grimshot

sudo usermod -aG video $USER
 
