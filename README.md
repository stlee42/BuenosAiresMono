# Buenos Aires Mono

Buenos Aires Mono is a monospaced font for programming forked from [Inconsolata LGC Short](https://github.com/eggsyntax/Inconsolata-LGC-Short) but with even more reduced line height and with vertically centered tilde.

### Customizations

- To set your own line height, please see [c9839cc](https://github.com/MihailJP/Inconsolata-LGC/commit/c9839cc066eb7ca2b1d2eedee06242ba203fdb77).
- For the vertical adjustment to tilde character, please see `center.tilde.vertically.py` in `script` folder. Offset the second argument to `translate` call, then run the script against each of the four `.sfd` files.

### Build instructions

With [fontforge](https://fontforge.org) and [ttfautohint](https://github.com/fonttools/ttfautohint-py) installed,

```
make
```
