#
# Makefile
# Shlomi Fish, 2019-03-24 20:01
#

BASENAME = about-supporting-older-perl5-releases
XHTML = about-supporting-older-perl5-releases.xhtml
ADOC = old-README.asciidoc
DOCBOOK5DOC = $(BASENAME).docbook5.xml
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

$(DOCBOOK5DOC): $(ADOC)
	asciidoctor --backend=docbook5 -o $@ $<
	perl fix-docbook5.pl $@

about-supporting-older-perl5-releases.xhtml: $(SOURCE)
	pod2xhtml < $< > $@

docbook: $(DOCBOOK5DOC)

upload: $(XHTML)
	sky -x up $<

# vim:ft=make
#
