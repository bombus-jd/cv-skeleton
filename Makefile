# Uses your private cv.tex if it exists, otherwise the template
SRC ?= $(if $(wildcard cv.tex),cv.tex,skeleton-cv.tex)

# Reads \newcommand{\cv<field>}{...} from SRC; umlauts and spaces are made safe for file names
field = $(shell sed -n 's/^\\newcommand{\\cv$(1)}{\([^}]*\)}.*/\1/p' $(SRC) | \
	sed -e 's/ä/ae/g; s/ö/oe/g; s/ü/ue/g; s/Ä/Ae/g; s/Ö/Oe/g; s/Ü/Ue/g; s/ß/ss/g; s/ /-/g')
NAME := $(call field,lastname)_$(call field,firstname)

LATEXMK := latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=output

.PHONY: all de en init clean

all: de en

de:
	$(LATEXMK) -jobname=$(NAME)_de $(SRC)

en:
	$(LATEXMK) -jobname=$(NAME)_en -usepretex='\let\buildenglish\relax' $(SRC)

# Creates your private cv.tex from the template, never overwrites it
init:
	@test ! -e cv.tex || { echo "cv.tex already exists"; exit 1; }
	cp skeleton-cv.tex cv.tex

clean:
	rm -f output/*.aux output/*.fdb_latexmk output/*.fls output/*.log output/*.out output/*.synctex.gz
