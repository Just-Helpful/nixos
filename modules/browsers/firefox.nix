{ pkgs, inputs, system, ... }:

let
  addons = pkgs.nur.repos.rycee.firefox-addons;
in {
  programs.firefox = {
    enable = true;

    profiles.alexc = {
      search.force = true;
      search.default = "DuckDuckGo";
      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
	    params = [
              { name = "type"; value = "packages"; }
	      { name = "query"; value = "{searchTerms}"; }
	    ];
	  }];
	  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	  definedAliases = [ "@np" ];
	};
	"Home Options" = {
	  urls = [{
            template = "https://home-manager-options.extranix.com";
	    params = [
	      { name = "release"; value = "master"; }
              { name = "query"; value = "{searchTerms}"; }
	    ];
	  }];
	  definedAliases = [ "@ho" ];
	};
      };

      extensions = with addons; [
      ];
    };
  };
}
