# A patch to prevent gnome-keyring overriding gpg ssh management
# from [discussion](https://discourse.nixos.org/t/disable-ssh-agent-from-gnome-keyring-on-gnome/28176/6)
#
# Be careful!
# This **can** and **will** prevent gnome-keyring from managing ssh keys
# If you want gnome-keyring to keep working for this, do not use.
# It'll also likely increase your build times a little, as it breaks caching
{ ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      gnome-keyring = prev.gnome-keyring.overrideAttrs (oldAttrs: {
        configureFlags = (builtins.filter (flag: flag != "--enable-ssh-agent") oldAttrs.configureFlags) ++ [
          "--disable-ssh-agent"
        ];
      });
    })
  ];
}
