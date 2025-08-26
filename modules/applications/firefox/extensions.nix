{
  programs.firefox.policies.ExtensionSettings = {
    # FoxyTab
    "foxytab@eros.man" = {
      installation_mode = "normal_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/foxytab/latest.xpi";
    };
    # Proton Pass
    "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
      installation_mode = "normal_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
    };
    # Tabliss
    "extension@tabliss.io" = {
      installation_mode = "normal_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/tabliss/latest.xpi";
    };
    # I still don't care about cookies
    "idcac-pub@guus.ninja" = {
      installation_mode = "normal_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
    };
    # uBlock Origin
    "uBlock0@raymondhill.net" = {
      installation_mode = "normal_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
    };
    # Dark reader
    "addon@darkreader.org" = {
      installation_mode = "normal_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
    };
  };
}
