default: txt pdf html docx

txt:
    pandoc \
        --from=markdown \
        --to=plain \
        --wrap=none \
        --output=cv-johannes-smit.txt \
        cv-johannes-smit.md
    sd '^-   ' '' cv-johannes-smit.txt
    sd '^    -   ' '    • ' cv-johannes-smit.txt
    sd '^        -   ' '        ‣ ' cv-johannes-smit.txt

pdf:
    pandoc \
        --from=markdown \
        --pdf-engine=tectonic \
        --template=template.tex \
        --output=cv-johannes-smit.pdf \
        cv-johannes-smit.md

html:
    pandoc \
        --from=markdown \
        --output=cv-johannes-smit.html \
        cv-johannes-smit.md

docx:
    pandoc \
        --from=markdown \
        --output=cv-johannes-smit.docx \
        cv-johannes-smit.md
