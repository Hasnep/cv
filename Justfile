src_dir := justfile_directory() / "src"
input_file := src_dir / "cv-johannes-smit.md"
output_dir := justfile_directory() / "output"

default: txt tex typst html docx

txt:
    mkdir -p {{ output_dir / "txt" }}
    pandoc \
        --from=markdown \
        --to=plain \
        --wrap=none \
        --output={{ output_dir / "txt" / "cv-johannes-smit.txt" }} \
        {{ input_file }}
    sd '^-   ' '' {{ output_dir / "txt" / "cv-johannes-smit.txt" }}
    sd '^    -   ' '    • ' {{ output_dir / "txt" / "cv-johannes-smit.txt" }}
    sd '^        -   ' '        ‣ ' {{ output_dir / "txt" / "cv-johannes-smit.txt" }}

tex:
    mkdir -p {{ output_dir / "tex" }}
    pandoc \
        --from=markdown \
        --pdf-engine=tectonic \
        --template={{ src_dir / "template.tex" }} \
        --output={{ output_dir / "tex" / "cv-johannes-smit.pdf" }} \
        {{ input_file }}

typst:
    mkdir -p {{ output_dir / "typst" }}
    pandoc \
        --from=markdown \
        --pdf-engine=typst \
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

format:
    mdformat **/*.md
    nix fmt **/*.nix