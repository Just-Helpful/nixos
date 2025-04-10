{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  users.users.default = {
    description = "default";
    isNormalUser = lib.mkForce true;
    shell = pkgs.nushell;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
  };
}
