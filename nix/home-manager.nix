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
      };
      home.file.".config/nvim".source = pkgs.linkFarm {
        lua = ./../lua;
        init.lua = ./../init.lua;
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
