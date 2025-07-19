# # Graphical Desktops
# I primarily use Gnome, as I'm reasonably comfortable with its defaults.
{
  imports = [
    ./themes
    ./dock.nix
    ./extensions
    ./desktop.nix
    ./windows.nix
    ./keybinds.nix
    ./workspaces.nix
  ];
}
