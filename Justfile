src_dir := justfile_directory() / "src"
input_file := src_dir / "cv-johannes-smit.md"
output_dir := env_var_or_default("OUTPUT_DIR", justfile_directory() / "output")

help:
    just --list

[parallel]
all: md txt tex typst html docx

md:
    mkdir -p {{ output_dir / "md" }}
    pandoc \
        --from=markdown \
        --to=commonmark \
        --wrap=none \
        --output={{ output_dir / "md" / "cv-johannes-smit.md" }} \
        {{ input_file }}

txt:
    mkdir -p {{ output_dir / "txt" }}
    pandoc \
        --from=markdown \
        --to=plain \
        --wrap=none \
        --output={{ output_dir / "txt" / "cv-johannes-smit.txt" }} \
        {{ input_file }}
    sd '^- ' '' {{ output_dir / "txt" / "cv-johannes-smit.txt" }}
    sd '^  - ' '• ' {{ output_dir / "txt" / "cv-johannes-smit.txt" }}
    sd '^    - ' "\t‣ " {{ output_dir / "txt" / "cv-johannes-smit.txt" }}

tex:
    mkdir -p {{ output_dir / "tex" }}
    export TEMPDIR=$(mktemp -d) && \
        env HOME=$TEMPDIR pandoc \
            --from=markdown \
            --pdf-engine=pdflatex \
            --template={{ src_dir / "template.tex" }} \
            --output=$TEMPDIR/cv-johannes-smit.pdf \
            {{ input_file }} && \
        cp $TEMPDIR/cv-johannes-smit.pdf {{ output_dir / "tex" / "cv-johannes-smit.pdf" }}

typst:
    mkdir -p {{ output_dir / "typst" }}
    pandoc \
        --from=markdown \
        --pdf-engine=typst \
        --template={{ src_dir / "template.typst" }} \
        --output={{ output_dir / "typst" / "cv-johannes-smit.pdf" }} \
        {{ input_file }}

html:
    mkdir -p {{ output_dir / "html" }}
    pandoc \
        --from=markdown \
        --output={{ output_dir / "html" / "cv-johannes-smit.html" }} \
        {{ input_file }}

docx:
    mkdir -p {{ output_dir / "docx" }}
    pandoc \
        --from=markdown \
        --output={{ output_dir / "docx" / "cv-johannes-smit.docx" }} \
        {{ input_file }}

clean:
    rm -rf {{ output_dir }}
