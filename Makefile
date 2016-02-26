TARGETS = LICENSE README.html index.html

AUTHOR = "[Gastón H. SALAZAR-SILVA](ghsalazar.github.io)"
DATE = "$$(date +%F)"
HTMLFLAGS = -c site/normalize.css \
            -c site/site.css \
            -s -S --mathjax --email-obfuscation=references \
            -A site/CCA-SA-4.0.inc \
            -V date-meta:$(DATE) -V author-meta:$(AUTHOR) --filter pandoc-citeproc

all: $(TARGETS)

LICENSE: LICENSE.markdown
	pandoc -t plain -o $@ $<

%.html: %.markdown site/site.css site/CCA-SA-4.0.inc
	gpp -D DATE=$(DATE) $< | pandoc -f markdown $(HTMLFLAGS) -o $@

.PHONNY: clean

clean:
	rm -f $(TARGETS) *~
