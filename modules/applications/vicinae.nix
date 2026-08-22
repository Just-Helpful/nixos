{ pkgs, ... }: {
  home.packages = with pkgs; [ vicinae ];

  home.services.vicinae = {
    process.argv = [
      "${pkgs.vicinae}/bin/vicinae"
      "server"
    ];
  };
}
