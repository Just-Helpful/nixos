# Nix-Config

NixOS configuration for a personal laptop, heavily inspired by vimjoyer and
NotAShelf

## Layout

This computer setup is defined via a flake based config and keeps the
possibility of defining config for multiple devices.

### `flake.nix`

The `flake.nix` is used to define the primary requirements for this config. Any
requirement in the `module/` directory needs to be declared here and should be
version locked correspondingly.

### `hosts/`

[Documentation](../hosts/README.md)

The `hosts/` directory is used to define the required configuration for a given
device. This is where you should put your `configuration.nix` and
`hardware-confguration.nix` when installing NixOS on a fresh device. The
`#default` config can be used as an example of how these configs can be split up
to make them slightly more parsable.

### `modules/`

[Documentation](../modules/README.md)

The `modules/` directory is used to define re-usable units for configuring a
device. If you plan on using all the modules defined here for a "complete"
device config, then you can simply add `<...>/modules` to the `imports` defined
in your `home.nix` to include _all_ of the modules.

For the most part, modules defined here can and will likely change with my
config. I don't currently define any config options when defining these modules
as again, I'm only using these modules for one device at the moment.

## Links

- [**Changelog and Todos**](./docs/Changelog.md)
- [**Reproduction Guide**](./docs/Reproduction.md)

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
- [Nix Starter](https://github.com/Misterio77/nix-starter-configs/tree/main) for
  config structuring
