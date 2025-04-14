# Changelog and Todos

<details>
<summary><h2><code>2025-04-14</code></h2></summary>

- [ ] Add vscode rust language support
- [ ] Have a look at whether AMD specific config is needed
  - See [this](https://discourse.nixos.org/t/enable-plasma-6/40541/27)
- [ ] Enable fingerprint reader for login
  - The error I'm currently getting seems to be _really_ obscure
  - I may need to pick apart some Ubuntu config, because that seems to work...
- [ ] Attempt to get remote backups with `rclone`
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/136#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...
  - There's now been an update posted on the rework
    [here](https://github.com/NotAShelf/nvf/discussions/748)
  - The active branch seems to be `lsp-redesign`
    [here](https://github.com/NotAShelf/nvf/tree/lsp-redesign)

</details>

<details>
<summary><h2><code>2025-04-12</code></h2></summary>

- [ ] Have a look at whether AMD specific config is needed
  - See [this](https://discourse.nixos.org/t/enable-plasma-6/40541/27)
- [ ] Enable fingerprint reader for login
  - The error I'm currently getting seems to be _really_ obscure
  - I may need to pick apart some Ubuntu config, because that seems to work...
- [x] Get `rustup` to use `.languages/rust/rustup`
  - I'll need to find how to add the relevant Environment variables to profile
- [ ] Attempt to get remote backups with `rclone`
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/136#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...
  - There's now been an update posted on the rework
    [here](https://github.com/NotAShelf/nvf/discussions/748)

</details>

<details>
<summary><h2><code>2025-04-11</code></h2></summary>

- [ ] Have a look at whether AMD specific config is needed
  - See [this](https://discourse.nixos.org/t/enable-plasma-6/40541/27)
- [ ] Enable fingerprint reader for login
- [ ] Get `rustup` to use `.languages/rust/rustup`
- [ ] Attempt to get remote backups with `rclone`
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/136#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...
  - There's now been an update posted on the rework
    [here](https://github.com/NotAShelf/nvf/discussions/748)

</details>

<details>
<summary><h2><code>2025-04-02</code></h2></summary>

- [x] Add shortcuts for updating home-manager
- [ ] Add `nixGL` wrapper to prism launcher
- [ ] Get `rustup` to use `.languages/rust/rustup`
- [ ] Attempt to get remote backups with `rclone`
- [ ] Add guide section on GPG keys
  - **Abandoned**: now using ssh keys
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/137#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...
  - There's now been an update posted on the rework
    [here](https://github.com/NotAShelf/nvf/discussions/748)

</details>

<details>
<summary><h2><code>2025-03-15</code></h2></summary>

- [ ] Get `rustup` to use `.languages/rust/rustup`
- [x] Isolate home manager module from NixOS config
- [ ] Attempt to get remote backups with `rclone`
- [x] Add NixOS options shortcut
- [x] Add Noogle shortcut
- [ ] Add guide section on GPG keys
- [x] Config Firefox extensions
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/137#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...

</details>

<details>
<summary><h2><code>2025-03-15</code></h2></summary>

- [ ] Attempt to get remote backups with `rclone`
- [x] Add NixOS options shortcut
- [x] Add Noogle shortcut
- [ ] Add guide section on GPG keys
- [x] Config Firefox extensions
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/137#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...

</details>

<details>
<summary><h2><code>2025-03-01</code></h2></summary>

- [ ] Add NixOS options shortcut
- [ ] Add Noogle shortcut
- [ ] Add guide section on GPG keys
- [x] Config Firefox extensions
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/137#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...

</details>

<details>
<summary><h2><code>2025-03-01</code></h2></summary>

- [ ] Add NixOS options shortcut
- [ ] Add Noogle shortcut
- [x] Use nightly firefox build
  - There's been some crap happening with Firefox recently...
- [x] Add Librewolf
- [ ] Add guide section on GPG keys
- [ ] Config Firefox extensions
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/137#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...

</details>

<details>
<summary><h2><code>2025-02-27</code></h2></summary>

- [x] Remove GitHub chat from Vscode
- [x] Fix broken Firefox build
- [ ] Add guide section on GPG keys
- [ ] Config Firefox extensions
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/137#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...

</details>

<details>
<summary><h2><code>2025-02-25</code></h2></summary>

- [ ] Add guide section on GPG keys
- [ ] Config Firefox extensions
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/137#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...

</details>

<details>
<summary><h2><code>2025-02-24</code></h2></summary>

- [x] Fix nix `command-not-found`
- [x] Add (nix) shell completion for nushell
- [ ] Add guide section on GPG keys
- [ ] Config Firefox extensions
- [ ] ~~Add nvim support for Github actions~~
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/137#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
  - The PR actually seems to be blocked on nvim `0.11.0`
    - apparently, this reworks lsp config in a big way...
- [x] Add README to top level folders
- [x] Attempt to remove titlebars from vscode (Pls!)
  - The Vscode custom bar is:
    1. enabled by default
    2. seems to do the best here...

</details>

<details>
<summary><h2><code>2025-02-22</code></h2></summary>

- [x] Fix Git pushing on nushell
- [x] Add gh search to firefox
- [x] Test out nushell
- [ ] Add nvim support for Github actions
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/137#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
- [ ] Add README to top level folders
- [ ] Attempt to remove titlebars from vscode (Pls!)

</details>

<details>
<summary><h2><code>2025-02-21</code></h2></summary>

- [ ] Test out nushell
- [x] Add options to collapse days in changelog
- [ ] Add nvim support for Github actions
- [ ] Add nvim support for yaml
  - This is likely blocked on an [PR](https://github.com/NotAShelf/nvf/pull/643)
  - Also see this
    [comment](https://github.com/NotAShelf/nvf/issues/137#issuecomment-2664735644)
  - This will **also** block Github action support
  - I'll either want to help out or just wait (depending on how busy raf is...)
    - I'm going to give it ~1 week and see what happens
- [ ] Add README to top level folders
- [ ] Attempt to remove titlebars from vscode (Pls!)

</details>

<details>
<summary><h2><code>2025-02-20</code></h2></summary>

- [ ] Add options to collapse days in changelog
- [ ] Add nvim support for Github actions
- [ ] Add nvim support for yaml
- [x] Fix github CI
- [ ] Add README to top level folders
- [x] Add simple github CI
  - just use `nix flake check`
- [ ] Attempt to remove titlebars from vscode (Pls!)
- [x] Move themes to `desktop/`
- [x] Split out gnome extensions
- [x] Fix flickering top bar
- [x] Remove `lilypad` extension
- [x] Add `hide-top-bar` extension
- [x] Correct info callout in guide
- [x] Move guide to separate file

</details>

<details>
<summary><h2><code>2025-02-19</code></h2></summary>

- [ ] Move guide to separate file
- [x] Set default settings for Lilypad
- [x] Add Gnome clipboard manager
- [x] Add Gnome todo extension
- [x] Add Gnome Lilypad
- [x] Format vscode docs on save
- [x] Add "Restructure Config" to guide

</details>

<details>
<summary><h2><code>2025-02-18</code></h2></summary>

- [ ] Format vscode docs on save
- [x] Remove unnecessary module functions
- [x] Set vscode tab size to 2
- [ ] Add "Restructure Config" to guide

</details>

<details>
<summary><h2><code>2025-02-17</code></h2></summary>

- [x] Add vscode file excludes
- [x] Make vscode settings mutable
- [x] Add vscode editor
- [ ] Add "Restructure Config" to guide

</details>

<details>
<summary><h2><code>2025-02-16</code></h2></summary>

- [x] Add option for mutable files
- [x] Fix broken git signing
- [ ] Add "Restructure Config" to guide

</details>

<details>
<summary><h2><code>2025-02-11</code></h2></summary>

- [x] Add `pnpm`
- [x] Add keybinds to duplicate lines
- [ ] Add "Restructure Config" to guide
- [x] Find how to use npm global installs
  - Just search on nix `pkgs`

</details>

<details>
<summary><h2><code>2025-02-10</code></h2></summary>

- [ ] Add "Restructure Config" to guide
- [x] Add scheduled gc and deduping
- [ ] Find how to use npm global installs
- [x] Add reproduction guide

</details>

<details>
<summary><h2><code>2025-02-09</code></h2></summary>

- [x] Move `~/.rustup/` directory
- [x] Add a `:bdelete` keybind to nvim
- [x] Document the `themes` module properly
- [ ] Find how to use npm global installs
- [x] Add nodejs support
- [x] Add sources to README
- [ ] Add reproduction guide

</details>
