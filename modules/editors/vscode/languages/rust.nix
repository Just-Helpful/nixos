{
  imports = [
    ../../../languages/rust
  ];

  programs.vscode.mutUserSettings = {
    "rust-analyzer.inlayHints.typeHints.enable" = false;
    "rust-analyzer.inlayHints.parameterHints.enable" = false;
  };
}
