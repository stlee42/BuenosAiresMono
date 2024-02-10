.INTERMEDIATE: Inconsolata-LGC-Polish.sfd Inconsolata-LGC-Bulgarian.sfd Inconsolata-LGC-Yugoslav.sfd
Inconsolata-LGC-Polish.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb pl < $< > $@
Inconsolata-LGC-Bulgarian.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb bg < $< > $@
Inconsolata-LGC-Yugoslav.sfd: Inconsolata-LGC.sfd regional.rb
	./regional.rb mkd < $< > $@

Inconsolata-LGC.ttc: Inconsolata-LGC.sfd Inconsolata-LGC-Polish.sfd Inconsolata-LGC-Bulgarian.sfd Inconsolata-LGC-Yugoslav.sfd makettc.py
	./makettc.py $@ Inconsolata-LGC.sfd Inconsolata-LGC-Polish.sfd Inconsolata-LGC-Bulgarian.sfd Inconsolata-LGC-Yugoslav.sfd
