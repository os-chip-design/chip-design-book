DOC=chip-design-book

all:
	pdflatex $(DOC)
	pdflatex $(DOC)
	bibtex $(DOC)
	makeindex $(DOC)
	pdflatex $(DOC)
	pdflatex $(DOC)


msbib:
	cat ../../paper/bib/*.bib > msbib-url.bib
	sed s/\ \ url/\ \ no-url/ < msbib-url.bib > msbib.bib
	rm msbib-url.bib

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.pdf *.gz
