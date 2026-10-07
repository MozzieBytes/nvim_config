/*
  import all nix files from a directory except flake.nix, and private files.
  (private files have `_` prefix, for example `_private.nix`.)

  logic taken from https://github.com/goxore/nixconf/blob/main/flake.nix
*/
inputs:
let
  inherit (inputs.nixpkgs) lib;
  inherit (lib.fileset) toList fileFilter;

  isNixModule = file: file.hasExt "nix" && file.name != "flake.nix" && !lib.hasPrefix "_" file.name;
in
path: toList (fileFilter isNixModule path)
