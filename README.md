# Buenos Aires Mono

Buenos Aires Mono is a monospaced font for programming, forked from [Inconsolata LGC Short](https://github.com/eggsyntax/Inconsolata-LGC-Short), but with even more reduced line spacing and with vertically centered tilde.

It comes in 4 styles (regular, italic, bold, and bold italic), and has Latin, Greek, and Cyrillic glyphs.

### Customizations

- To set your own line spacing, please see [c9839cc](https://github.com/stlee42/BuenosAiresMono/commit/c9839cc066eb7ca2b1d2eedee06242ba203fdb77). It is currently set to zero. To increase the spacing between lines, increase the LineGap parameter.
- For the vertical adjustment to tilde character, please see `center.tilde.vertically.py` in `script` folder. Offset the second argument to `translate` call, then run the script.

### Build instructions

With [fontforge](https://fontforge.org) and [ttfautohint](https://github.com/fonttools/ttfautohint-py) installed,

```
make
```

## Download

Download OpenType font files (`BuenosAiresMono-OT.zip`) or TrueType font files (`BuenosAiresMono.zip`) from the [releases](https://github.com/stlee42/BuenosAiresMono/releases) page.

## License

Buenos Aires Mono is licensed under SIL Open Font License (OFL). See [`LICENSE`](LICENSE) file for more information.
