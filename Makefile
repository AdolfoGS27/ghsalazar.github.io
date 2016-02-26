TARGETS = LICENSE index.html

AUTHOR = "[Gastón H. SALAZAR-SILVA](ghsalazar.github.io)"
DATE = "$$(date +%F)"
HTMLFLAGS = -c site/normalize.css \
            -c site/site.css \
            -s -S --mathjax --email-obfuscation=references \
            -V date:$(DATE) -V author:$(AUTHOR) --filter pandoc-citeproc

all: $(TARGETS)

LICENSE: LICENSE.markdown
	pandoc -t plain -o $@ $<

%.html: %.markdown
	pandoc $(HTMLFLAGS) -o $@ $< 

.PHONNY: clean

clean:
	rm -f $(TARGETS) *~
