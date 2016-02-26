TARGETS = LICENSE index.html

all: $(TARGETS)

LICENSE: LICENSE.markdown
	pandoc -t plain -o $@ $<

%.html: %.markdown
	pandoc -o $@ $< 

.PHONNY: clean

clean:
	rm -f $(TARGETS) *~
