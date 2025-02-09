# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    # Include other configs
    ./users
    ./network.nix
    ./localisation.nix
    # Patch gnome keyring to allow gpg agent
    ../../modules/tools/gpg-patch.nix
    # Start home manager
    inputs.home-manager.nixosModules.default
  ];

  # Features
  nix.settings.experimental-features = [
    "pipe-operators"
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Install base programs.
  programs.zsh.enable = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [ wl-clipboard ];
  environment.pathsToLink = [ "/share/zsh" ];

  system.stateVersion = "24.11";
}
