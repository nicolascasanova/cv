all: html pdf docx rtf tex

tex: output/resume.tex
output/resume.tex: resume.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o output/resume.tex resume.md

pdf: output/resume.pdf
output/resume.pdf: output/resume.tex
	context --result=output/resume.pdf \
            output/resume.tex

html: output/resume.html
output/resume.html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o output/resume.html resume.md

docx: output/resume.docx
output/resume.docx: resume.md
	pandoc -s -S resume.md -o output/resume.docx

rtf: output/resume.rtf
output/resume.rtf: resume.md
	pandoc -s -S resume.md -o output/resume.rtf

clean:
	rm -f output/resume.html
	rm -f output/resume.tex
	rm -f output/resume.tuc
	rm -f output/resume.log
	rm -f output/resume.pdf
	rm -f output/resume.docx
	rm -f output/resume.rtf
