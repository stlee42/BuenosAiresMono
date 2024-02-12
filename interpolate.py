#!/usr/bin/env fontforge

from sys import argv
import fontforge

font1 = fontforge.open(argv[2])
font = font1.interpolateFonts(float(argv[4]), argv[3])
font.encoding = "UnicodeBmp"
font.save(argv[1])
