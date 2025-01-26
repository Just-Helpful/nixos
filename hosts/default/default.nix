# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  inputs,
  pkgs,
  system,
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
    ../../modules/base/gpg-patch.nix
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
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

  # Install base programs.
  programs.zsh.enable = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [ wl-clipboard ];
  environment.pathsToLink = [ "/share/zsh" ];

  system.stateVersion = "24.11";
}
