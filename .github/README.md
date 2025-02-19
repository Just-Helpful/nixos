# Nix-Config

NixOS configuration for a personal laptop, heavily inspired by vimjoyer

[**Changelog and Todos**](./docs/Changelog.md)

## Layout

This computer setup is defined via a flake based config and keeps the
possibility of defining config for multiple devices.

### `flake.nix`

The `flake.nix` is used to define the primary requirements for this config. Any
requirement in the `module/` directory needs to be declared here and should be
version locked correspondingly.

### `hosts/`

The `hosts/` directory is used to define the required configuration for a given
device. This is where you should put your `configuration.nix` and
`hardware-confguration.nix` when installing NixOS on a fresh device. The
`#default` config can be used as an example of how these configs can be split up
to make them slightly more parsable.

### `modules/`

The `modules/` directory is used to define re-usable units for configuring a
device. If you plan on using all the modules defined here for a "complete"
device config, then you can simply add `<...>/modules` to the `imports` defined
in your `home.nix` to include _all_ of the modules.

For the most part, modules defined here can and will likely change with my
config. I don't currently define any config options when defining these modules
as again, I'm only using these modules for one device at the moment.

## Reproduction

### 1. Install NixOS

My preferred method of installation is the NixOS installation
[page][NixOS Page]<br/> Which allows the creation of a bootable USB using the
Gnome disk image program<br/> allowing the installation over an existing install
(because I installed this from ubuntu).

[NixOS Page]: https://nixos.org/download/#graphical-iso-image

### 2. Create Nix Flake

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

### 3. Restructure Config

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

> [!INFO]
> in `nix`, importing a folder is the same as importing its `default.nix`

## Sources

There's really quite a lot of sources I've used for this:

- [NVF](https://github.com/NotAShelf/nvf/tree/main) for both configuring neovim
  and its beautiful README
- [NixOS Wiki](https://nixos.wiki/wiki/Main_Page) for common package and config
  setup
- [Nix Packages](https://search.nixos.org/packages?type=packages&channel=unstable)
  for available packages
- [Nix Pills](https://nixos.org/guides/nix-pills/17-nixpkgs-overriding-packages.html)
  for package overrides
