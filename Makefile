SHELL=/bin/sh

# LaTeX options
TEX_COMPILER=pdflatex
TEX_OPTIONS=--interaction=nonstopmode
TEX=$(TEX_COMPILER) $(TEX_OPTIONS)

# The list of all required tex files to build the document.
ALL_TEX_FILES=$(wildcard *.tex)

.SILENT:
.IGNORE:

# Aliases for the common outputs
all: print full
print: dragonclaw_print.pdf
full: dragonclaw.pdf

%.pdf: $(addsuffix .tex, $(basename $(@))) $(ALL_TEX_FILES)
	$(TEX) $(addsuffix .tex, $(basename $(@)))
	$(TEX) $(addsuffix .tex, $(basename $(@)))
	$(TEX) $(addsuffix .tex, $(basename $(@)))

.PHONY: clean
clean:
	echo Cleaning ...
	rm -rf *.gz *.aux *.log *.out *.bbl *.blg *.bak *.bcf *.xml *.toc *.pdf *.lot *.lof tex/
	echo ... done