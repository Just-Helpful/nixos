{ pkgs, ... }: {
  home.packages = with pkgs; [ leiningen ];
}
