{ ... }: {
  programs.git = {
    enable = true;
    userName = "Alex Colby";
    userEmail = "alexanderdcolby@gmail.com";
    signing = {
      key = null;
      signByDefault = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
