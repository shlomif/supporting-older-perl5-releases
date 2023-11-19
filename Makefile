#
# Makefile
# Shlomi Fish, 2019-03-24 20:01
#


XHTML = about-supporting-older-perl5-releases.xhtml
ADOC = old-README.asciidoc
MD = README.md
RPOD = README.pod
SOURCE := about-supporting-older-perl5-releases.pod

all: $(ADOC) $(RPOD)

$(ADOC): $(SOURCE)
	pod2asciidoctor --output $@ $<

$(MD): $(SOURCE)
	pod2github $< $@

$(RPOD): $(SOURCE)
	cp -f $< $@

about-supporting-older-perl5-releases.xhtml: $(SOURCE)
	pod2xhtml < $< > $@

upload: $(XHTML)
	sky -x up $<

# vim:ft=make
#
