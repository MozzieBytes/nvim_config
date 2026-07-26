{
  description = "NeoVIM Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs = inputs:
  let
    inherit (inputs.flake-parts.lib) mkFlake;
    import-tree = import ./nix/lib/_import-tree.nix inputs;
  in
    mkFlake { inherit inputs; } {
      imports = import-tree ./nix;
    };
}
