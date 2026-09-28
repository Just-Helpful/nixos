{ lib, ... }: {
  imports = [ ../../applications/anyrun.nix ];

  wayland.windowManager.hyprland.settings = {
    bind = [
      # Execute Rofi with only the SUPER key
      {
        _args = [
          "SUPER + SUPER_L"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"pkill anyrun || anyrun\")")
        ];
      }
    ];
  };
}
