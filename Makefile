.PHONY: build
build: cv-johannes-smit.txt cv-johannes-smit.pdf cv-johannes-smit.html cv-johannes-smit.docx

cv-johannes-smit.txt: cv-johannes-smit.md
	pandoc \
	-f markdown \
	--wrap none \
	-o cv-johannes-smit.txt \
	cv-johannes-smit.md
	sed -i 's/        -   /        ‣ /g' cv-johannes-smit.txt
	sed -i 's/    -   /    • /g' cv-johannes-smit.txt
	sed -i 's/-   /• /g' cv-johannes-smit.txt

cv-johannes-smit.pdf: cv-johannes-smit.md template.tex
	pandoc \
	-f markdown \
	--pdf-engine tectonic \
	--template template.tex \
	-o cv-johannes-smit.pdf \
	cv-johannes-smit.md

cv-johannes-smit.html: cv-johannes-smit.md
	pandoc \
	-f markdown \
	-o cv-johannes-smit.html \
	cv-johannes-smit.md

cv-johannes-smit.docx: cv-johannes-smit.md
	pandoc \
	-f markdown \
	-o cv-johannes-smit.docx \
	cv-johannes-smit.md

.PHONY: clean
clean:
	rm -f cv-johannes-smit.pdf cv-johannes-smit.html
