# Makefile for Inconsolata font

FONTS=Inconsolata-LGC.ttf \
      Inconsolata-LGC-Bold.ttf \
      Inconsolata-LGC-Italic.ttf \
      Inconsolata-LGC-BoldItalic.ttf
EXTRAPOLATES=Inconsolata-LGC-Minimum.sfd \
             Inconsolata-LGC-Maximum.sfd \
             Inconsolata-LGC-MinimumItalic.sfd \
             Inconsolata-LGC-MaximumItalic.sfd
OTFONTS=${FONTS:.ttf=.otf}
UFOS=${FONTS:.ttf=.ufo} ${EXTRAPOLATES:.sfd=.ufo}
DESIGNSPACES=Inconsolata-LGC.designspace Inconsolata-LGC-Italic.designspace
DOCUMENTS=README.md ChangeLog LICENSE
PKGS=InconsolataLGC.tar.xz InconsolataLGC-OT.tar.xz
VARFONTS=Inconsolata-LGC-Variable.ttf \
         Inconsolata-LGC-Variable-Italic.ttf
FFCMD=for i in $?;do fontforge -lang=ff -c "Open(\"$$i\");Generate(\"$@\");Close()";done
TTFPKGCMD=rm -rf $*; mkdir $*; cp ${FONTS} ${DOCUMENTS} $*
OTFPKGCMD=rm -rf $*; mkdir $*; cp ${OTFONTS} ${DOCUMENTS} $*

.PHONY: all
all: ttf otf

.SUFFIXES: .sfd .ttf .otf .ufo

.sfd.ttf:
	${FFCMD}
.sfd.otf:
	${FFCMD}
.sfd.ufo:
	${FFCMD}
	grep "^Version: " Inconsolata-LGC.sfd | sed -e "s/^Version: //"
	sed -i~ -e "/<key>openTypeNameVersion<\/key>/ { n; s/<string>.*<\/string>/<string>$$(grep "^Version: " $< | sed -e "s/^Version: //")<\/string>/; }" $@/fontinfo.plist

.PHONY: ttf otf variable
ttf: ${FONTS}
otf: ${OTFONTS}
variable: ${VARFONTS}

.SUFFIXES: .tar.xz .tar.gz .tar.bz2 .zip
.PHONY: dist
dist: ${PKGS}

Inconsolata-LGC-Minimum.sfd: Inconsolata-LGC.sfd Inconsolata-LGC-Bold.sfd
	./interpolate.py $@ $^ -1.6
Inconsolata-LGC-MinimumItalic.sfd: Inconsolata-LGC-Italic.sfd Inconsolata-LGC-BoldItalic.sfd
	./interpolate.py $@ $^ -1.6
Inconsolata-LGC-Maximum.sfd: Inconsolata-LGC.sfd Inconsolata-LGC-Bold.sfd
	./interpolate.py $@ $^ 2.5
Inconsolata-LGC-MaximumItalic.sfd: Inconsolata-LGC-Italic.sfd Inconsolata-LGC-BoldItalic.sfd
	./interpolate.py $@ $^ 2.5

Inconsolata-LGC.designspace: Inconsolata-LGC.ufo Inconsolata-LGC-Bold.ufo Inconsolata-LGC-Minimum.ufo Inconsolata-LGC-Maximum.ufo
	./make_designspace.py $@ $^
Inconsolata-LGC-Italic.designspace: Inconsolata-LGC-Italic.ufo Inconsolata-LGC-BoldItalic.ufo Inconsolata-LGC-MinimumItalic.ufo Inconsolata-LGC-MaximumItalic.ufo
	./make_designspace.py $@ $^

Inconsolata-LGC-Variable.ttf: Inconsolata-LGC.designspace
	fontmake -m $< -o variable --output-path $@
Inconsolata-LGC-Variable-Italic.ttf: Inconsolata-LGC-Italic.designspace
	fontmake -m $< -o variable --output-path $@

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

ChangeLog: .git # GIT
	./mkchglog.rb > $@ # GIT

.PHONY: clean
clean:
	-rm -f ${FONTS} ${OTFONTS} ${VARFONTS} ChangeLog
	-rm -rf ${UFOS} ${EXTRAPOLATES} ${DESIGNSPACES}
	-rm -rf ${PKGS} ${PKGS:.tar.xz=} ${PKGS:.tar.xz=.tar.bz2} \
	${PKGS:.tar.xz=.tar.gz} ${PKGS:.tar.xz=.zip}
