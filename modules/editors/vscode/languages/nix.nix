{ pkgs, ... }:
{
  home.packages = with pkgs; [ nil ];

  programs.vscode.mutUserSettings = {
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "${pkgs.nil}/bin/nil";
    "nix.serverSettings" = {
      "nil.formatting" = {
        "command" = [
          "nix"
          "fmt"
          "{path}"
        ];
      };
    };
  };
}
