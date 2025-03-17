{ pkgs, ... }:
{
  imports = [
    ./c.nix
  ];

  home.packages = with pkgs; [
    (rustup.overrideAttrs {
      # RUSTUP_HOME = "/home/alexc/.languages/rust/rustup";
      CARGO_HOME = "/home/alexc/.languages/rust/cargo";
    })
  ];
}
