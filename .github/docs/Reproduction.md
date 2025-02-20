# Reproduction

## 1. Install NixOS

My preferred method of installation is the NixOS installation
[page][NixOS Page]<br/> Which allows the creation of a bootable USB using the
Gnome disk image program<br/> allowing the installation over an existing install
(because I installed this from ubuntu).

[NixOS Page]: https://nixos.org/download/#graphical-iso-image

## 2. Create Nix Flake

In order to make the nix config more reproducible between devices,<br/> I've
used a simple nix flake. In order to use flakes, you'll first<br/> need to
enable them in your `configuration.nix` as so:

```nix
# configuration.nix
{ pkgs, ... }: {
    # ...
    nix.settings.experimental-features = [
        "flakes"
        # you'll likely also want to enable extra `nix` commands
        "nix-command"
    ]
    # ...
}
```

Then we can create a minimal `flake.nix` that includes the `configuration.nix`:

```nix
# flake.nix
{
    description = "Nixos configuration flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"
    };

    outputs = {
        self,
        nixpkgs,
        ...
    }@inputs:
    let
        system = "x86_64-linux";
    in
    {
        nixosConfigurations.default = {
            specialArgs = { inherit inputs };
            modules = [ ./configuration.nix ];
        };
    };
}
```

## 3. Restructure Config

At this point, we can move from a flat config structure<br/>to one that allows
for multiple different configurations for different devices.<br/>This leaves the
root repository a bit cleaner and better splits out configs.

i.e. we go from:

```
./:
- configuration.nix
- hardware.nix
- flake.nix
- flake.lock
```

to the layout:

```
./:
- hosts/default/
  - default.nix # from configuration.nix
  - hardware.nix
- flake.nix
- flake.lock
```

This can be acheived via the commands:

```
mkdir -p ./hosts/default
mv ./hardware.nix ./hosts/default/hardware.nix
mv ./configuration.nix ./hosts/default/default.nix
```

You'll also need to update the imports used in `flake.nix` as so:

```nix
# flake.nix
{
    ...
    outputs = ... {
        ...
        nixosConfigurations.default = {
            ...
            modules = [ ./hosts/default ];
        };
    }
}
```

> [!TIP]
> in `nix`, importing a folder is the same as importing its `default.nix`
