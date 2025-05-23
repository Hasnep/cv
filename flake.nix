{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            name = "cv";
            packages =
              [
                pkgs.just
                pkgs.pandoc
                pkgs.sd
                pkgs.tectonic
                pkgs.typst
              ]
              # Pre-commit
              ++ [
                pkgs.actionlint
                pkgs.markdownlint-cli2
                (pkgs.python3.withPackages (python-pkgs: [
                  python-pkgs.mdformat
                  python-pkgs.mdformat-frontmatter
                ]))
                pkgs.nixfmt-rfc-style
                pkgs.nodePackages.prettier
                pkgs.pre-commit
                pkgs.python3Packages.pre-commit-hooks
                pkgs.ratchet
                pkgs.taplo
              ];
          };
          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
