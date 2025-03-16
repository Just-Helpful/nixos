{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    (rustup.overrideAttrs {
      RUSTUP_HOME = "/home/alexc/.languages/rust/rustup";
      CARGO_HOME = "/home/alexc/.languages/rust/cargo";
    })
  ];
}
