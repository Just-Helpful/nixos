{
  imports = [
    ../../../languages/rust.nix
  ];

  programs.vscode.mutUserSettings = {
    "rust-analyzer.inlayHints.typeHints.enable" = false;
    "rust-analyzer.inlayHints.parameterHints.enable" = false;
  };
}
