{
  inputs,
  pkgs,
  ...
}:
{

  users.users.alex-colby = {
    description = "Alex Colby";
    group = "alex-colby";
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.nushell;
  };

  users.groups.alex-colby = { };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users.alexc = import ../../home/default;
  };
}
