# Makefile for BuenosAiresMono font

FONTS=BuenosAiresMono-Regular.ttf \
      BuenosAiresMono-Bold.ttf \
      BuenosAiresMono-Italic.ttf \
      BuenosAiresMono-BoldItalic.ttf
OTFONTS=${FONTS:.ttf=.otf}
DOCUMENTS=README ChangeLog LICENSE
PKGS=BuenosAiresMono.tar.xz BuenosAiresMono-OT.tar.xz
FFCMD=for i in $?;do fontforge -lang=ff -c "Open(\"$$i\");Generate(\"$@\");Close()";done
TTFPKGCMD=rm -rf $*; mkdir $*; cp ${FONTS} ${DOCUMENTS} $*
OTFPKGCMD=rm -rf $*; mkdir $*; cp ${OTFONTS} ${DOCUMENTS} $*

.PHONY: all
all: ttf otf

.SUFFIXES: .sfd .ttf .otf

.sfd.ttf:
	${FFCMD}
.sfd.otf:
	${FFCMD}

.PHONY: ttf otf
ttf: ${FONTS}
otf: ${OTFONTS}

.SUFFIXES: .tar.xz .tar.gz .tar.bz2 .zip
.PHONY: dist
dist: ${PKGS}

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
	-rm -rf ${PKGS} ${PKGS:.tar.xz=} ${PKGS:.tar.xz=.tar.bz2} \
	${PKGS:.tar.xz=.tar.gz} ${PKGS:.tar.xz=.zip}
