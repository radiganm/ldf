#!/usr/bin/make
## makefile
## Mac Radigan

.PHONY: init run dox pandoc view clean clobber

.DEFAULT_GOAL := default

target = lfd

template = ./template
output   = ./output
figures  = ./figures

default: doc

doc: pandoc

dox: init
	which python3
	rm -rf $(output)
	env PYTHONPATH=./dox/library           \
	  python3 ./dox/dox.py                 \
	    -v -r                              \
	    -I ./include                       \
	    -t $(template)                     \
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

clobber: clean
	-rm -f $(target).pdf

clean:
	-rm -f $(target).tex
	-rm -f $(target).aux
	-rm -f $(target).log
	-rm -f $(target).out
	-rm -f $(target).aux

run:
	#env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_a.py
	#env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_b.py
	#env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_c.py
	#env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_d.py
	#env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_e.py
	#env octave --norc $(output)/03.01/problem_3_1_a.m
	#env octave --norc $(output)/03.01/problem_3_1_a_fast.m
	#env octave --norc $(output)/03.01/problem_3_1_b.m
	#env octave --norc $(output)/03.02/problem_3_2.m
	#env octave --norc $(output)/03.03/problem_3_3_b.m
	 env octave --norc $(output)/03.03/problem_3_3_c.m

init:
	mkdir -p $(figures)

view:
	@zathura -x a lfd.pdf 1>/dev/null 2>/dev/null

update:
	git submodule init &&   \
	git submodule update && \
	(cd dox; git pull origin master)

## *EOF*
