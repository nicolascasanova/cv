today = $(shell /bin/date +%Y-%m-%d)
outfile = CV-NCasanova-$(today)

all: html pdf docx rtf tex

tex: $(outfile).tex
$(outfile).tex: resume.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o output/$@ $<

pdf: $(outfile).tex
	context --result=output/$(outfile).pdf \
            output/$<

html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o output/$(outfile).html resume.md

docx: $(outfile).docx

rtf: $(outfile).rtf

$(outfile).docx $(outfile).rtf: resume.md
	pandoc -s -S $< -o output/$@

clean:
	rm -f output/*
