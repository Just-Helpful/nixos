{
  inputs,
  pkgs,
  ...
}:
{
  users.users.alexc = {
    isNormalUser = true;
    description = "Alex Colby";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.nushell;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users.alexc = import ../../home/default;
  };
}
