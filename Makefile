output_dir:=./output
src_dir=.

svg_options:=-s\
             -Tsvg\
             -Gsize=4,4\!\
             -Groot=3\
	     -Nwidth=0.3\
             -Nfixedsize=true\
             -Nlabel=\
             -Nshape=circle\
             -Ecolor=black

svgs:=$(output_dir)/frucht.svg\

.PHONY: all clean

all: svg

svg: $(svgs)

$(svgs): $(output_dir)/%.svg: $(src_dir)/%.gv | $(output_dir)
	gvpr -c -f colour -a '1 2 3 1 2 3 2 3 1 3 1 2' $< | twopi $(svg_options) -o $@

$(output_dir)/:
	mkdir -p $@

clean:
	rm -rf $(output_dir)
