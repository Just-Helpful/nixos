{ pkgs, ... }: {
  programs.anyrun.enable = true;
  programs.anyrun.config.plugins = [
    "${pkgs.anyrun}/lib/libapplications.so"
    "${pkgs.anyrun}/lib/librink.so"
  ];
}
