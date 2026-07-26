{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];
  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "aarch64-darwin"
  ];
  perSystem = { pkgs, ... }: {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        stylua.enable = true;
        nixfmt.enable = true;
        mdformat.enable = true;
        jsonfmt.enable = true;
      };
      settings.global.excludes = [
        ".envrc"
      ];
    };
    devShells.default = pkgs.mkShell {
      buildInputs =
        with pkgs;
        [
          (pkgs.writeShellScriptBin "vim" ''exec ${pkgs.neovim}/bin/nvim "$@"'')
          neovim
          lua
          lua-language-server
          tree-sitter
          nil
        ];
    };
  };
}
