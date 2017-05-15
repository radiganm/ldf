#!/usr/bin/make
## makefile
## Mac Radigan

.PHONY: init run dox pandoc view

.DEFAULT_GOAL := default

template = ./template
output   = ./output
figures  = ./figures

default: doc

doc: pandoc

dox: init
	which python3
	rm -rf $(output)
	env PYTHONPATH=./dox/library       \
	  python3 ./dox/library/dox/dox.py \
	    -v -r                          \
	    -I ./include                   \
	    -t $(template)                 \
	    -o $(output)

pandoc: dox
	pandoc $(output)/lfd.md                \
	     --wrap=preserve                   \
	     --template=./include/template.tex \
	     -f markdown                       \
	     -F pandoc-minted                  \
	     -t latex                          \
	     -o lfd.tex
	pdflatex --shell-escape lfd.tex

run:
	env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_a.py
	env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_b.py
	env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_c.py
	env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_d.py
	env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_e.py

init:
	mkdir -p $(figures)

view:
	@zathura -x a lfd.pdf 1>/dev/null 2>/dev/null

update:
	git submodule init &&   \
	git submodule update && \
	(cd dox; git pull origin master)

## *EOF*
