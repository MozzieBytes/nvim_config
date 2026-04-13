{
  description = "NeoVIM Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-global = {
      url = "github:MozzieBytes/nix-global";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nix-global,
      ...
    }:
    let
      fmtConf = {
        programs.stylua.enable = true;
      };
    in
    {
      homeManagerModules.neovim =
        { pkgs, ... }:
        {
          programs.lazygit.enable = true;
          programs.neovim = {
            enable = true;
            defaultEditor = true;
            vimAlias = true;
            withRuby = false;
            withPython3 = false;
          };
          home.file.".config/nvim".source = ./.;
          home.packages = with pkgs; [
            tree-sitter
            lua5_1
            luarocks
            ollama
          ];
        };
    }
    // nix-global.lib.mkDevEnv fmtConf (
      pkgs: corePkgs: {
        devShells.default = pkgs.mkShell {
          buildInputs =
            with pkgs;
            [
              (pkgs.writeShellScriptBin "vim" ''exec ${pkgs.neovim}/bin/nvim "$@"'')
              neovim
              lua
              lua-language-server
              tree-sitter
            ]
            ++ corePkgs;
        };
      }
    );
}
