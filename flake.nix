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
        "x86_64-linux"
      ];
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            name = "cv";
            packages = [
              # keep-sorted start
              pkgs.just
              pkgs.pandoc
              pkgs.sd
              pkgs.tectonic
              pkgs.typst
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
