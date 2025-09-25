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
      home-managerModules.neovim =
        { pkgs, ... }:
        {
          programs = {
            lazygit.enable = true;
            neovim = {
              enable = true;
              defaultEditor = true;
              vimAlias = true;
            };
          };
          home.file.".config/nvim".source = ./.;
        };
    }
    // nix-global.lib.mkDevEnv fmtConf (
      pkgs: corePkgs: {
        devShells.default = pkgs.mkShell {
          buildInputs =
            with pkgs;
            [
              lua
              lua-language-server
            ]
            ++ corePkgs;
        };
      }
    );
}
