svg_options:=-s\
             -Tsvg\
             -Gsize=4,4\!\
             -Groot=3\
             -Nwidth=0.3\
             -Nfixedsize=true\
             -Nlabel=\
             -Nshape=circle\
             -Ecolor=black

.PHONY: all install

all: svg/frucht.svg

svg/frucht.svg: gv/frucht.gv
	gvpr -c -f src/colour -a '1 2 3 1 2 3 2 3 1 3 1 2' $< | twopi $(svg_options) -o $@

install:
	sudo apt-get update
	sudo apt-get -y install graphviz
