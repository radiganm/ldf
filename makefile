#!/usr/bin/make
## makefile
## Mac Radigan

.PHONY: init run dox pandoc

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
	pandoc $(output)/lfd.md         \
	     --wrap=preserve            \
	     -f markdown                \
	     -t latex                   \
	     -o lfd.pdf

run:
	env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_a.py
	env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_b.py
	env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_c.py
	env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_d.py
	env PYTHONPATH=./library python3 $(output)/01.04/problem_1_4_e.py

init:
	mkdir -p $(figures)

update:
	git submodule init &&   \
	git submodule update && \
	(cd dox; git pull origin master)

## *EOF*
