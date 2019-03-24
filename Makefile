#
# Makefile
# Shlomi Fish, 2019-03-24 20:01
#

all:

XHTML = about-supporting-older-perl5-releases.xhtml

about-supporting-older-perl5-releases.xhtml: about-supporting-older-perl5-releases.pod
	pod2xhtml < $< > $@

upload: $(XHTML)
	sky -x up $<


# vim:ft=make
#
