SHELL=/bin/sh
THESIS=main
REF=ref

.SUFFIXES:
.SUFFIXES: .bib .pdf .tex
.PHONY: clean cleanall

run: $(THESIS).pdf

$(THESIS).pdf: $(THESIS).bbl $(THESIS).tex
	xelatex $(THESIS).tex -draftmode
	xelatex $(THESIS).tex 

$(THESIS).bbl: $(THESIS).aux
	bibtex $(THESIS).aux

$(THESIS).aux: $(REF).bib
	xelatex $(THESIS).tex -draftmode
	xelatex $(THESIS).tex -draftmode

clean:
	rm -rf *.aux data/*.aux *.lof *.log *.lot *.toc *.bbl *.blg *.snm *.out *.nav *.dvi *.synctex.gz

cleanall:
	rm -rf *.aux data/*.aux *.lof *.log *.lot *.toc *.bbl *.blg $(THESIS).pdf *.snm *.out *.nav *.dvi *.synctex.gz
