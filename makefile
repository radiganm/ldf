#!/usr/bin/make
## makefile
## Mac Radigan

.PHONY:
.DEFAULT_GOAL := default

default: doc

doc:
	cat */*.md > lfd.md
	pandoc                \
	        lfd.md        \
	     -f markdown      \
	     -t latex         \
	     -o lfd.pdf

## *EOF*
