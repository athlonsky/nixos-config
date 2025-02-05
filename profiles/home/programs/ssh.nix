{
  home-manager.users.elxreno.programs.ssh = {
    enable = true;
    # compression = true;
    serverAliveInterval = 10;
    matchBlocks = {
      "desktop" = {
        hostname = "100.107.189.129";
      };
      "biba" = {
        hostname = "109.171.24.112";
      };
      "boba" = {
        hostname = "109.171.24.112";
        port = 23;
      };
      "nixis" = {
        hostname = "100.77.238.46";
      };
      "noxer" = {
        hostname = "100.67.12.44";
      };
      "kebab" = {
        hostname = "100.103.121.36";
      };

      "nixbuild" = {
        hostname = "eu.nixbuild.net";
        identityFile = "~/.ssh/nixbuild";
        identitiesOnly = true;
      };

      "fedoraproject" = {
        host = "*.fedoraproject.org *.fedorahosted.org *.fedorainfracloud.org fedorapeople.org";
        identityFile = "~/.ssh/id_rsa";
      };

      "git" = {
        host = "github.com gitlab.com gerrit.aospa.co aur.archlinux.org code.elxreno.ninja";
        identityFile = "~/.ssh/id_ecdsa-git";
      };
    };
  };
}
