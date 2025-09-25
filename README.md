# Neovim Configuration

> [!IMPORTANT]
> This config has been developed exclusively with my usecase in mind.
> You're more than welcome to steal snippets for your own config, but I can't guarantee
> That any Issues/Pull-Requests raised will get attention.

This repo contains my NeoVim configuration. It has been designed to work
either independently, or as part of a [home-manager](https://github.com/nix-community/home-manager) module.

## Plugins

### Plugin-Management

> [!NOTE]
> Due to the choice in package manager, the reproducibility of this config is not guaranteed.

Despite being designed with home-manager in mind, this configuration still uses a combination of the Lazy Plugin-Manager and Mason for the management of dependencies.

The exception to this is language-servers, which are expected to be installed externally to the editor using your preferred package manager.

This approach allows this configuration to run on systems that don't utilize Nix.

### Plugin List

> [!NOTE]
> Not all plugins are listed here. Some are omitted for brevity

| Plugin | Explanation |
|:------:|:-----------:|
| Language Servers | The following languages are currently supported: Go, Lua, Terraform, Nix |
| [direnv.nvim](https://github.com/actionshrimp/direnv.nvim) | A wrapper around direnv, that allows for hot-loading of environment changes within the Neovim shell. |
| [Gen.Nvim](https://github.com/David-Kunz/gen.nvim) | Configured to allow for a local-copilot by utilizing [Ollama](https://ollama.com). Configured to run on `<space>]` |
| [neotree](https://github.com/nvim-neo-tree/neo-tree.nvim) | A traditional file-explorer for neovim. Configured to open on `<space>fe` |
| [toggleterm](https://github.com/akinsho/toggleterm.nvim) | A simple floating-terminal that is used to enable rapid-testing of changes. Configured to open on `<space>tt` |

## Local Development

This project is set up to be developed with the attached [nix flake](./flake.nix), and [direnv](https://direnv.net/).

This allows this project to manage it's own dependencies within an ephemeral nix-shell.

To take advantage of this, make sure that you have [nix](https://nixos.org/) and direnv configured on your machine, and then run the following command within the root of this directory.

```bash
direnv allow
```

## Installing

> [!IMPORTANT]
> To use this configuration you MUST have NeoVIM installed on your machine.

### Without home-manager

To install this configuration onto a machine without home-manager, simply clone the repo into `~/.config/nvim`.

### With home-manager (Nix Flakes)

To add this configuration to your system using home-manager with nix flakes.

Add the following to your flake:

```nix
{
  description = "Example home-manager configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-config = {
      url = "github:MozzieBytes/nvim_config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
    nixpkgs,
    home-manager,
    nvim-config,
    }:
    let
      system = "x86_64-linux";
    in
      {
        homeConfigurations = {
          user = home-manager.lib.homeManagerConfiguratoin {
            modules = [
              ...
              nvim-config.home-managerModules.neovim
            ];
          };
        };
      };
}
```
