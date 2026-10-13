{
  flake.homeManagerModules.neovim =
    { pkgs, ... }:
    {
      programs.lazygit.enable = true;
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        withRuby = false;
        withPython3 = false;
        extraConfig = builtins.readFile ../init.lua;
      };
      home.file.".config/nvim/lua" = {
        source = ../lua;
        recursive = true;
      };
      home.packages = with pkgs; [
        tree-sitter
        lua5_1
        luarocks
        ollama
        lsof
        fd
      ];
    };
}
