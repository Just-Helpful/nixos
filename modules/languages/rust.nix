{ pkgs, config, ... }:
{
  imports = [
    ./c.nix
  ];

  home.sessionVariables = {
    RUSTUP_HOME = "${config.home.homeDirectory}/.languages/rust/rustup/";
    CARGO_HOME = "${config.home.homeDirectory}/.languages/rust/cargo/";
  };

  home.packages = with pkgs; [
    rustup
  ];
}
