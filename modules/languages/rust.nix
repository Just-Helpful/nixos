{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    (rustc.overrideAttrs {
      RUSTUP_HOME = "~/.languages/rust/rustup";
    })
    (cargo.overrideAttrs {
      CARGO_HOME = "~/.languages/rust/cargo";
    })
  ];
}
