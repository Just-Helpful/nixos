# Changelog and Todos

- [ ] Improve multicursor support in `nvim`
  - Honestly `multicursors.nvim` seems like a bit of a patch job
  - whereas `multiple-cursors.nvim` seems a lot better integrated
- [ ] Enable fingerprint reader for login
  - The error I'm currently getting seems to be _really_ obscure
  - I may need to pick apart some Ubuntu config, because that seems to work...
  - https://wiki.nixos.org/wiki/Fingerprint_scanner
  - https://github.com/NixOS/nixpkgs/issues/171136
  - https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/security/pam.nix
  - I think I'll need to modify `/etc/pam.d/login` to match `/etc/pam.d/sudo`

<details>
<summary><h2><code>2025-08-16</code></h2></summary>

- [x] Try to get "install from github working"
  - This should consist of having a hook that runs:
    1. `mkdir ~/.config/nixos`
    2. `cd ~/.config/nixos`
    3. `git init`
    4. `git remote add origin ssh://git@github.com/Just-Helpful/Nix-Config`
    5. `git pull`
  - I'm a bit worried about this being impure though...
  - Potentially `nix flake --template` could work better
  - Honestly, `nix flake clone --dest ~/.config/nixos` is just enough on it's
    own

</details>

<details>
<summary><h2><code>2025-07-28</code></h2></summary>

- [x] Remove AI sidebar in vscode
- [x] Fix broken gnome clipboard manager
  - This just seems to have been fixed upstream

</details>

<details>
<summary><h2><code>2025-07-12</code></h2></summary>

- [x] Fix buffer deleting in `nvim`
  - Currently this seems to break pane widths

</details>

<details>
<summary><h2><code>2025-06-21</code></h2></summary>

- [x] Attempt to get remote backups with `rclone`

</details>

<details>
<summary><h2><code>2025-05-25</code></h2></summary>

- [x] Fix `useGlobalPackages` conflict with home manager
- [x] Add nvim support for yaml
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
<summary><h2><code>2025-04-18</code></h2></summary>

- [x] Add vscode rust language support

</details>

<details>
<summary><h2><code>2025-04-14</code></h2></summary>

- [x] Have a look at whether AMD specific config is needed
  - See [this](https://discourse.nixos.org/t/enable-plasma-6/40541/27)
  - Probably not, it looks like the consensus is: "AMD provides it's own drivers
    most of the time"

</details>

<details>
<summary><h2><code>2025-04-12</code></h2></summary>

- [x] Get `rustup` to use `.languages/rust/rustup`
  - I'll need to find how to add the relevant Environment variables to profile

</details>

<details>
<summary><h2><code>2025-04-02</code></h2></summary>

- [x] Add shortcuts for updating home-manager

</details>

<details>
<summary><h2><code>2025-03-15</code></h2></summary>

- [x] Isolate home manager module from NixOS config
- [x] Add NixOS options shortcut
- [x] Add Noogle shortcut
- [x] Config Firefox extensions

</details>

<details>
<summary><h2><code>2025-03-15</code></h2></summary>

- [x] Add NixOS options shortcut
- [x] Add Noogle shortcut
- [x] Config Firefox extensions

</details>

<details>
<summary><h2><code>2025-03-01</code></h2></summary>

- [x] Config Firefox extensions

</details>

<details>
<summary><h2><code>2025-03-01</code></h2></summary>

- [x] Use nightly firefox build
  - There's been some crap happening with Firefox recently...
- [x] Add Librewolf

</details>

<details>
<summary><h2><code>2025-02-27</code></h2></summary>

- [x] Remove GitHub chat from Vscode
- [x] Fix broken Firefox build

</details>

<details>
<summary><h2><code>2025-02-24</code></h2></summary>

- [x] Fix nix `command-not-found`
- [x] Add (nix) shell completion for nushell

</details>

<details>
<summary><h2><code>2025-02-22</code></h2></summary>

- [x] Fix Git pushing on nushell
- [x] Add gh search to firefox
- [x] Test out nushell

</details>

<details>
<summary><h2><code>2025-02-21</code></h2></summary>

- [x] Add options to collapse days in changelog

</details>

<details>
<summary><h2><code>2025-02-20</code></h2></summary>

- [x] Fix github CI
- [x] Add simple github CI
  - just use `nix flake check`
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

- [x] Set default settings for Lilypad
- [x] Add Gnome clipboard manager
- [x] Add Gnome todo extension
- [x] Add Gnome Lilypad
- [x] Format vscode docs on save
- [x] Add "Restructure Config" to guide

</details>

<details>
<summary><h2><code>2025-02-18</code></h2></summary>

- [x] Remove unnecessary module functions
- [x] Set vscode tab size to 2

</details>

<details>
<summary><h2><code>2025-02-17</code></h2></summary>

- [x] Add vscode file excludes
- [x] Make vscode settings mutable
- [x] Add vscode editor

</details>

<details>
<summary><h2><code>2025-02-16</code></h2></summary>

- [x] Add option for mutable files
- [x] Fix broken git signing

</details>

<details>
<summary><h2><code>2025-02-11</code></h2></summary>

- [x] Add `pnpm`
- [x] Add keybinds to duplicate lines
- [x] Find how to use npm global installs
  - Just search on nix `pkgs`

</details>

<details>
<summary><h2><code>2025-02-10</code></h2></summary>

- [x] Add scheduled gc and deduping
- [x] Add reproduction guide

</details>

<details>
<summary><h2><code>2025-02-09</code></h2></summary>

- [x] Move `~/.rustup/` directory
- [x] Add a `:bdelete` keybind to nvim
- [x] Document the `themes` module properly
- [x] Add nodejs support
- [x] Add sources to README

</details>
