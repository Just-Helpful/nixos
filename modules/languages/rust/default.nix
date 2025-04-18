{ pkgs, config, ... }:
{
  imports = [
    ../c.nix
    ./rustfmt.nix
  ];

  home.sessionVariables = {
    RUSTUP_HOME = "${config.home.homeDirectory}/.languages/rust/rustup/";
    CARGO_HOME = "${config.home.homeDirectory}/.languages/rust/cargo/";
  };

  home.packages = with pkgs; [
    rustup
  ];

  programs.rustfmt = {
    enable = true;
    settings = {
      edition = "2024";
      tab_spaces = 2;
      use_field_init_shorthand = true;
    };
  };
}
