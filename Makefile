#
# Makefile
# Shlomi Fish, 2019-03-24 20:01
#


XHTML = about-supporting-older-perl5-releases.xhtml
MD = README.md

all: $(MD)

$(MD): about-supporting-older-perl5-releases.pod
	pod2github $< $@

about-supporting-older-perl5-releases.xhtml: about-supporting-older-perl5-releases.pod
	pod2xhtml < $< > $@

upload: $(XHTML)
	sky -x up $<


# vim:ft=make
#
