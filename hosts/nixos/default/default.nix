# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  # modulesPath,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    # Include other configs
    ./users.nix
    ./network.nix
    ./services.nix
    ./localisation.nix

    # Enable LiveUSB creation
    # (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  # Features
  nix.settings.experimental-features = [
    "pipe-operators"
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true;
  nix.gc.automatic = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Install base programs.
  programs.zsh.enable = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [ wl-clipboard ];
  environment.pathsToLink = [ "/share/zsh" ];

  system.stateVersion = "24.11";
}
