{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      perSystem =
        { self', pkgs, ... }:
        let
          tex = pkgs.texlive.withPackages (ps: [
            # keep-sorted start
            ps.babel
            ps.cm-super
            ps.csquotes
            ps.enumitem
            ps.geometry
            ps.hyperref
            ps.scheme-basic
            ps.setspace
            # keep-sorted end
          ]);
        in
        {
          packages =
            let
              buildCv =
                format:
                { nativeBuildInputs, ... }:
                pkgs.stdenvNoCC.mkDerivation {
                  name = format;
                  src = pkgs.lib.cleanSource ./.;
                  nativeBuildInputs = [
                    pkgs.pandoc
                    pkgs.just
                  ]
                  ++ nativeBuildInputs;
                  env = {
                    OUTPUT_DIR = "$out";
                    SOURCE_DATE_EPOCH = toString inputs.self.lastModified;
                  };
                  buildPhase = "just ${format}";
                  dontUseJustBuild = true;
                  dontUseJustCheck = true;
                  dontUseJustInstall = true;
                };
            in
            {
              default = self'.packages.cv-all;
              cv-all = pkgs.symlinkJoin {
                name = "cv-all";
                paths = [
                  # keep-sorted start
                  self'.packages.cv-docx
                  self'.packages.cv-html
                  self'.packages.cv-md
                  self'.packages.cv-tex
                  self'.packages.cv-txt
                  self'.packages.cv-typst
                  # keep-sorted end
                ];
              };
              # keep-sorted start
              cv-docx = buildCv "docx" { nativeBuildInputs = [ ]; };
              cv-html = buildCv "html" { nativeBuildInputs = [ ]; };
              cv-md = buildCv "md" { nativeBuildInputs = [ ]; };
              cv-tex = buildCv "tex" { nativeBuildInputs = [ tex ]; };
              cv-txt = buildCv "txt" { nativeBuildInputs = [ pkgs.sd ]; };
              cv-typst = buildCv "typst" { nativeBuildInputs = [ pkgs.typst ]; };
              # keep-sorted end
            };
          devShells.default = pkgs.mkShell {
            name = "cv";
            packages = [
              # keep-sorted start
              pkgs.just
              pkgs.pandoc
              pkgs.sd
              pkgs.typst
              tex
              # keep-sorted end
            ]
            # Pre-commit
            ++ [
              # keep-sorted start
              pkgs.actionlint
              pkgs.keep-sorted
              pkgs.nixfmt
              pkgs.nodePackages.prettier
              pkgs.pre-commit
              pkgs.python3Packages.pre-commit-hooks
              pkgs.ratchet
              pkgs.rumdl
              pkgs.taplo
              pkgs.tex-fmt
              pkgs.typstyle
              # keep-sorted end
            ];
          };
          formatter = pkgs.nixfmt-tree;
        };
    };
}
