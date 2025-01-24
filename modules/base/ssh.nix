{ ... }: {
  programs.ssh = {
    enable = true;
    userKnownHostsFile = "~/.config/ssh/known_hosts";
  };
}
