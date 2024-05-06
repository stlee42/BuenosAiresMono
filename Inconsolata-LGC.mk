.INTERMEDIATE: Inconsolata-LGC-Romanian.sfd Inconsolata-LGC-Polish.sfd Inconsolata-LGC-Bulgarian.sfd Inconsolata-LGC-Yugoslav.sfd
.INTERMEDIATE: Inconsolata-LGC-Livonian.sfd Inconsolata-LGC-Sami.sfd Inconsolata-LGC-Pinyin.sfd Inconsolata-LGC-African.sfd
Inconsolata-LGC-Romanian.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb ro < $< > $@
Inconsolata-LGC-Polish.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb pl < $< > $@
Inconsolata-LGC-Bulgarian.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb bg < $< > $@
Inconsolata-LGC-Yugoslav.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb mkd < $< > $@
Inconsolata-LGC-Livonian.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb liv < $< > $@
Inconsolata-LGC-Sami.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb smi < $< > $@
Inconsolata-LGC-Pinyin.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb zhp < $< > $@
Inconsolata-LGC-African.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb ewe < $< > $@

Inconsolata-LGC.ttc: Inconsolata-LGC.sfd \
Inconsolata-LGC-Romanian.sfd Inconsolata-LGC-Polish.sfd Inconsolata-LGC-Bulgarian.sfd Inconsolata-LGC-Yugoslav.sfd\
Inconsolata-LGC-Livonian.sfd Inconsolata-LGC-Sami.sfd Inconsolata-LGC-Pinyin.sfd Inconsolata-LGC-African.sfd
	./makettc.py $@ $^
