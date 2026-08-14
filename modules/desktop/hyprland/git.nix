{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Andrea Finocchio";
        email = "finocchio.andrea94@gmail.com";
      };
      checkout = {
        defaultRemote = "origin";
      };
      pull = {
        rebase = false;
      };
    };
  };
}
