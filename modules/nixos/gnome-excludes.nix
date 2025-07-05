{ pkgs, ... }:
{
  environment.gnome.excludePackages = with pkgs; [
    cheese # photo booth
    epiphany # web browser
    simple-scan # document scanner
    yelp # help viewer
    geary # email client
    gnome-contacts
    gnome-music
    gnome-photos
  ];
}
