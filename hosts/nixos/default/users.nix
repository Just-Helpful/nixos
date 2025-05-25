{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ../../../modules/nixos/steam.nix
  ];

  users.users.default = {
    description = "default";
    isNormalUser = lib.mkForce true;
    shell = pkgs.nushell;

    group = "default";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  users.groups.default = { };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
  };
}
