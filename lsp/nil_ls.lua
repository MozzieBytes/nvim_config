require("nvim-treesitter").install{ "nix" }
return {
	cmd = { "nil" },
	filetypes = { "nix" },
	root_markers = { "flake.nix", ".git" },
}
