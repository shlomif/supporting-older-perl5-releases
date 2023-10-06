#
# Makefile
# Shlomi Fish, 2019-03-24 20:01
#


XHTML = about-supporting-older-perl5-releases.xhtml
ADOC = README.asciidoc
MD = README.md

all: $(ADOC)

$(ADOC): about-supporting-older-perl5-releases.pod
	pod2asciidoctor --output $@ $<

$(MD): about-supporting-older-perl5-releases.pod
	pod2github $< $@

about-supporting-older-perl5-releases.xhtml: about-supporting-older-perl5-releases.pod
	pod2xhtml < $< > $@

upload: $(XHTML)
	sky -x up $<


# vim:ft=make
#
