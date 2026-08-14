{ lib, ... }: {
  imports = [ ../../applications/kitty.nix ];

  wayland.windowManager.hyprland.settings = {
    bind = [
      {
        _args = [
          "SUPER + /"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")
        ];
      }
    ];
  };
}
