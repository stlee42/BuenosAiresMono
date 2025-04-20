# Makefile for BuenosAiresMono font

MASTERS=BuenosAiresMono-Regular-master.sfd \
	BuenosAiresMono-Italic-master.sfd \
	BuenosAiresMono-Bold-master.sfd \
	BuenosAiresMono-BoldItalic-master.sfd
FONTS=BuenosAiresMono-Regular.ttf \
      BuenosAiresMono-Italic.ttf \
      BuenosAiresMono-Thin.ttf \
      BuenosAiresMono-ThinItalic.ttf \
      BuenosAiresMono-Bold.ttf \
      BuenosAiresMono-BoldItalic.ttf
EXTRAPOLATES=BuenosAiresMono-Minimum-interpolated.sfd \
             BuenosAiresMono-Maximum-interpolated.sfd \
             BuenosAiresMono-MinimumItalic-interpolated.sfd \
             BuenosAiresMono-MaximumItalic-interpolated.sfd
OTFONTS=${FONTS:.ttf=.otf}
UFOS=${MASTERS:.sfd=.ufo} ${FONTS:.ttf=.ufo} ${EXTRAPOLATES:.sfd=.ufo}
DESIGNSPACES=BuenosAiresMono-Roman.designspace BuenosAiresMono-Italic.designspace
DOCUMENTS=README.md ChangeLog LICENSE
PKGS=BuenosAiresMono.tar.xz BuenosAiresMono-OT.tar.xz
TTFPKGCMD=rm -rf $*; mkdir $*; rsync -R ${FONTS} ${DOCUMENTS} $*
OTFPKGCMD=rm -rf $*; mkdir $*; rsync -R ${OTFONTS} ${DOCUMENTS} $*

.PHONY: all
all: ttf otf

.SUFFIXES: .sfd .ttf .otf .woff .woff2 .ufo

.sfd.ufo:
	for i in $?;do fontforge -lang=ff -c "Open(\"$$i\");Generate(\"$@\");Close()";done
	sed -i~ -e "/<key>openTypeNameVersion<\/key>/ { n; s/<string>.*<\/string>/<string>$$(grep "^Version: " $< | sed -e "s/^Version: //")<\/string><key>postscriptIsFixedPitch<\/key><true\/>/; }" $@/fontinfo.plist

BuenosAiresMono-Regular.ufo: BuenosAiresMono-Roman.designspace
	fontmake -m ./"$^" -i 'Buenos Aires Mono Regular' -o ufo
BuenosAiresMono-Thin.ufo: BuenosAiresMono-Roman.designspace
	fontmake -m ./"$^" -i 'Buenos Aires Mono Thin' -o ufo
BuenosAiresMono-Bold.ufo: BuenosAiresMono-Roman.designspace
	fontmake -m ./"$^" -i 'Buenos Aires Mono Bold' -o ufo
BuenosAiresMono-Italic.ufo: BuenosAiresMono-Italic.designspace
	fontmake -m ./"$^" -i 'Buenos Aires Mono Italic' -o ufo
BuenosAiresMono-ThinItalic.ufo: BuenosAiresMono-Italic.designspace
	fontmake -m ./"$^" -i 'Buenos Aires Mono Thin Italic' -o ufo
BuenosAiresMono-BoldItalic.ufo: BuenosAiresMono-Italic.designspace
	fontmake -m ./"$^" -i 'Buenos Aires Mono Bold Italic' -o ufo

.ufo.ttf:
	fontmake -u ./"$^" -o ttf --output-path "$@" -a
.ufo.otf:
	fontmake -u ./"$^" -o otf --output-path "$@"

.PHONY: ttf otf
ttf: ${FONTS}
otf: ${OTFONTS}

.SUFFIXES: .tar.xz .tar.gz .tar.bz2 .zip
.PHONY: dist
dist: ${PKGS}

BuenosAiresMono-Minimum-interpolated.sfd: BuenosAiresMono-Regular-master.sfd BuenosAiresMono-Bold-master.sfd
	./script/interpolate.py $@ $^ -1.6
BuenosAiresMono-MinimumItalic-interpolated.sfd: BuenosAiresMono-Italic-master.sfd BuenosAiresMono-BoldItalic-master.sfd
	./script/interpolate.py $@ $^ -1.6
BuenosAiresMono-Maximum-interpolated.sfd: BuenosAiresMono-Regular-master.sfd BuenosAiresMono-Bold-master.sfd
	./script/interpolate.py $@ $^ 2.5
BuenosAiresMono-MaximumItalic-interpolated.sfd: BuenosAiresMono-Italic-master.sfd BuenosAiresMono-BoldItalic-master.sfd
	./script/interpolate.py $@ $^ 2.5

BuenosAiresMono-Roman.designspace: BuenosAiresMono-Regular-master.ufo BuenosAiresMono-Bold-master.ufo BuenosAiresMono-Minimum-interpolated.ufo BuenosAiresMono-Maximum-interpolated.ufo
	./script/make_designspace.py $@ $^
BuenosAiresMono-Italic.designspace: BuenosAiresMono-Italic-master.ufo BuenosAiresMono-BoldItalic-master.ufo BuenosAiresMono-MinimumItalic-interpolated.ufo BuenosAiresMono-MaximumItalic-interpolated.ufo
	./script/make_designspace.py $@ $^

BuenosAiresMono.tar.xz: ${FONTS} ${DOCUMENTS}
	${TTFPKGCMD}; tar cfvJ $@ $*
BuenosAiresMono.tar.gz: ${FONTS} ${DOCUMENTS}
	${TTFPKGCMD}; tar cfvz $@ $*
BuenosAiresMono.tar.bz2: ${FONTS} ${DOCUMENTS}
	${TTFPKGCMD}; tar cfvj $@ $*
BuenosAiresMono.zip: ${FONTS} ${DOCUMENTS}
	${TTFPKGCMD}; zip -9r $@ $*

BuenosAiresMono-OT.tar.xz: ${OTFONTS} ${DOCUMENTS}
	${OTFPKGCMD}; tar cfvJ $@ $*
BuenosAiresMono-OT.tar.gz: ${OTFONTS} ${DOCUMENTS}
	${OTFPKGCMD}; tar cfvz $@ $*
BuenosAiresMono-OT.tar.bz2: ${OTFONTS} ${DOCUMENTS}
	${OTFPKGCMD}; tar cfvj $@ $*
BuenosAiresMono-OT.zip: ${OTFONTS} ${DOCUMENTS}
	${OTFPKGCMD}; zip -9r $@ $*

ChangeLog: .git # GIT
	./mkchglog.rb > $@ # GIT

.PHONY: clean
clean:
	-rm -f ${FONTS} ${OTFONTS} ChangeLog
	-rm -rf ${UFOS} ${EXTRAPOLATES} ${DESIGNSPACES}
	-rm -rf ${PKGS} ${PKGS:.tar.xz=} ${PKGS:.tar.xz=.tar.bz2} \
	${PKGS:.tar.xz=.tar.gz} ${PKGS:.tar.xz=.zip}
