# VirtualBox is significantly better integrated as a NixOS module
{
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
}
