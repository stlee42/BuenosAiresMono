Inconsolata LGC
===============
![Inconsolata LGC font specimen](doc/InconsolataLGC_specimen.png)

Inconsolata is one of the most suitable font for programmers created by Raph
Levien. Since the original Inconsolata does not contain Cyrillic alphabet,
it was slightly inconvenient for not a few programmers from Russia.

Inconsolata LGC is a modified version of Inconsolata with added the Cyrillic
alphabet which directly descends from Inconsolata Hellenic supporting modern
Greek.


Inconsolata LGC changes
-----------------------
* Cyrillic glyphs and additional symbols added.
* Italic and Bold font added.

### Changes inherited from Inconsolata Hellenic
* Greek glyphs.

### Changes inherited from Inconsolata-dz:
* Straight quotation marks.


Regional forms
--------------
Inconsolata LGC supports OpenType `locl` feature to display Polish,
Romanian, Bulgarian, Macedonian, and Serbian specific variant. TTC version
is intended for use in apps which do not support `locl` feature.

### Polish _kreska_ ###
![Differences between default and Polish variants](doc/Polish_kreska.png)

Polish _kreska_ looks steeper than acute accent.

For legacy apps, use **Inconsolata LGC Polish** in the TTC.

### Romanian comma accent ###
![Differences between default and Romanian variants](doc/Romanian_comma_accent.png)

Romanian alphabet has S and T with comma below, not with cedilla. The `locl`
feature for Romanian is included for compatibility: using codepoints in
Latin Extended B is recommended.

In addition, D with cedilla will be replaced with D with comma below since it
was used for pre-1904 spelling. It is now spelt with Z.

For legacy apps, use **Inconsolata LGC Romanian** in the TTC.

### Bulgarian variant ###
![Differences between Russian and Bulgarian variants](doc/Bulgarian_variant.png)

Bulgarian Cyrillic alphabet overall looks more round than Russian one. Some
of them look like italic forms made upright. _El_ looks like uppercase lambda
and uppercase _De_ like delta with descender. Lowercase _ve_, _zhe_, _ka_,
and _yu_ have ascenders and _ze_ has descender.

For legacy apps, use **Inconsolata LGC Bulgarian** in the TTC.

### Serbian and Macedonian italic ###
![Differences between Russian and Serbian italic](doc/Serbian_italic.png)

Serbian and Macedonian Cyrillic alphabet has italic forms different from
Russian one. Serbian and Macedonian take delta-like _be_ while Russian takes
6-like one. In Serbian italic forms, _ge_, _pe_, and _te_ look like i, u, and
upside-down m, all three with a top bar while Russian ones looks like
mirror-image s, lowercase n and m.
Lowercase _de_ looks like g. In some fonts, Russian one looks like round d,
but Inconsolata LGC is not designed so.
Delta-like _be_ also applies in Roman (non-italic) fonts.

For legacy apps, use **Inconsolata LGC Yugoslav** in the TTC.

### Livonian comma accent ###
Livonian alphabet has D and T with comma below, not with cedilla. However,
since there is not an OpenType language system tag, `locl` feature is not
available for Livonian.

Use **Inconsolata LGC Livonian** in the TTC.

### Sami _Eng_ ###
In Sami languages, uppercase Eng should use that derived from uppercase N.
Default glyph in this font is that from lowercase n.
This feature is not activated for Kildin Sami since it is usually written
in Cyrillic.

For legacy apps, use **Inconsolata LGC Sami** in the TTC.

### Pinyin variants ###
In Chinese fonts, acute accent (2nd tone or _yangping_) usually looks
pointing upwards, unlike that of Western languages which is pointing
downwards.
Also, single-story lowercase _a_ is used when a tone mark is above it.

However since Inconsolata is not a Chinese font, _Hanzi_ is not included.
The OpenType language system tag is `ZHP ` (note the trailing space).

For legacy apps, use **Inconsolata LGC Pinyin** in the TTC.


Miscellaneous variants
----------------------

### `onum`: old style numerals ###
Old style numerals are “lowercase” of numerals: 0, 1, and 2 are of x-height,
6 and 8 have ascenders, and the others have descenders. They are also known
as text figures.
On the other hand, lining (or titling) numerals are “uppercase” to which
this font defaults.

### `cv01`: zero without slash ###
The glyph was included but not used in the original Inconsolata. Feature
tag `zero` is inappropriate here because zero is slashed by default in this
font.

### `cv02`: _r_ with serif ###
The glyph was included but not used in the original Inconsolata.

### `cv03`: variants of _Eng_ ###
Uppercase _Eng_ can have glyphs derived from either upper- or lowercase
of N.


Build-time dependencies
-----------------------
* [FontForge](https://fontforge.org/) with both Python and classic scripting
  feature enabled
* For TTC, also:
  * [Adobe Font Development Kit for OpenType][1] to build TTC
* For variable font, also:
  * [fonttools](https://github.com/fonttools/fonttools)
  * [fontmake](https://github.com/googlefonts/fontmake)

[1]: https://github.com/adobe-type-tools/afdko

License
-------
Inconsolata LGC is licensed under [SIL OFL](LICENSE).
