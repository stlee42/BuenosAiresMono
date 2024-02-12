# Makefile for Inconsolata font

FONTS=Inconsolata-LGC.ttf \
      Inconsolata-LGC-Bold.ttf \
      Inconsolata-LGC-Italic.ttf \
      Inconsolata-LGC-BoldItalic.ttf
OTFONTS=${FONTS:.ttf=.otf}
TTCFONTS=${FONTS:.ttf=.ttc}
DOCUMENTS=README.md ChangeLog LICENSE
PKGS=InconsolataLGC.tar.xz InconsolataLGC-OT.tar.xz InconsolataLGC-TTC.tar.xz
FFCMD=for i in $?;do fontforge -lang=ff -c "Open(\"$$i\");Generate(\"$@\");Close()";done
TTFPKGCMD=rm -rf $*; mkdir $*; cp ${FONTS} ${DOCUMENTS} $*
OTFPKGCMD=rm -rf $*; mkdir $*; cp ${OTFONTS} ${DOCUMENTS} $*
TTCPKGCMD=rm -rf $*; mkdir $*; cp ${TTCFONTS} ${DOCUMENTS} $*

.PHONY: all
all: ttf otf ttc

.SUFFIXES: .sfd .ttf .otf

include Inconsolata-LGC.mk
include Inconsolata-LGC-Bold.mk
include Inconsolata-LGC-Italic.mk
include Inconsolata-LGC-BoldItalic.mk

Inconsolata-LGC-Bold.mk: Inconsolata-LGC.mk
	sed -E -e 's/\.(sfd|ttc)/-Bold.\1/g' $< > $@
Inconsolata-LGC-Italic.mk: Inconsolata-LGC.mk
	sed -E -e 's/\.(sfd|ttc)/-Italic.\1/g' $< > $@
Inconsolata-LGC-BoldItalic.mk: Inconsolata-LGC.mk
	sed -E -e 's/\.(sfd|ttc)/-BoldItalic.\1/g' $< > $@

.sfd.ttf:
	${FFCMD}
.sfd.otf:
	${FFCMD}

.PHONY: ttf otf ttc
ttf: ${FONTS}
otf: ${OTFONTS}
ttc: ${TTCFONTS}

.SUFFIXES: .tar.xz .tar.gz .tar.bz2 .zip
.PHONY: dist
dist: ${PKGS}

InconsolataLGC.tar.xz: ${FONTS} ${DOCUMENTS}
	${TTFPKGCMD}; tar cfvJ $@ $*
InconsolataLGC.tar.gz: ${FONTS} ${DOCUMENTS}
	${TTFPKGCMD}; tar cfvz $@ $*
InconsolataLGC.tar.bz2: ${FONTS} ${DOCUMENTS}
	${TTFPKGCMD}; tar cfvj $@ $*
InconsolataLGC.zip: ${FONTS} ${DOCUMENTS}
	${TTFPKGCMD}; zip -9r $@ $*

InconsolataLGC-OT.tar.xz: ${OTFONTS} ${DOCUMENTS}
	${OTFPKGCMD}; tar cfvJ $@ $*
InconsolataLGC-OT.tar.gz: ${OTFONTS} ${DOCUMENTS}
	${OTFPKGCMD}; tar cfvz $@ $*
InconsolataLGC-OT.tar.bz2: ${OTFONTS} ${DOCUMENTS}
	${OTFPKGCMD}; tar cfvj $@ $*
InconsolataLGC-OT.zip: ${OTFONTS} ${DOCUMENTS}
	${OTFPKGCMD}; zip -9r $@ $*

InconsolataLGC-TTC.tar.xz: ${TTCFONTS} ${DOCUMENTS}
	${TTCPKGCMD}; tar cfvJ $@ $*
InconsolataLGC-TTC.tar.gz: ${TTCFONTS} ${DOCUMENTS}
	${TTCPKGCMD}; tar cfvz $@ $*
InconsolataLGC-TTC.tar.bz2: ${TTCFONTS} ${DOCUMENTS}
	${TTCPKGCMD}; tar cfvj $@ $*
InconsolataLGC-TTC.zip: ${TTCFONTS} ${DOCUMENTS}
	${TTCPKGCMD}; zip -9r $@ $*

ChangeLog: .git # GIT
	./mkchglog.rb > $@ # GIT

.PHONY: clean
clean:
	-rm -f ${FONTS} ${OTFONTS} ${TTCFONTS} ChangeLog
	-rm -f ${FONTS:.ttf=-Polish.sfd} ${FONTS:.ttf=-Bulgarian.sfd} ${FONTS:.ttf=-Yugoslav.sfd}
	-rm -f Inconsolata-LGC-Bold.mk Inconsolata-LGC-Italic.mk Inconsolata-LGC-BoldItalic.mk
	-rm -rf ${PKGS} ${PKGS:.tar.xz=} ${PKGS:.tar.xz=.tar.bz2} \
	${PKGS:.tar.xz=.tar.gz} ${PKGS:.tar.xz=.zip}
