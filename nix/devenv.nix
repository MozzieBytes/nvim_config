{ inputs, ... }:
{

  imports = with inputs; [
    treefmt-nix.flakeModule
    git-hooks.flakeModule
  ];
  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "aarch64-darwin"
  ];
  perSystem = { config, pkgs, ... }: {
    pre-commit.settings.hooks.nixfmt.enable = true;
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        stylua.enable = true;
        stylua.settings = {
          indent_type = "Spaces";
          indent_width = 2;
        };
        nixfmt.enable = true;
        mdformat.enable = true;
        jsonfmt.enable = true;
      };
      settings.global.excludes = [
        ".envrc"
      ];
    };
    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        (pkgs.writeShellScriptBin "vim" ''exec ${pkgs.neovim}/bin/nvim "$@"'')
        neovim
        lua
        lua-language-server
        tree-sitter
        nil
      ];
      packages = config.pre-commit.settings.enabledPackages;
      shellHook = config.pre-commit.shellHook;
    };
  };
}
