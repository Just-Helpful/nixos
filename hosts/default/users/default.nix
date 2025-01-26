{ inputs, system, pkgs, ... }: {
  users.users.alexc = {
    isNormalUser = true;
    description = "Alex Colby";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs system; };
    users.alexc = import ./home.nix;
  };
}
