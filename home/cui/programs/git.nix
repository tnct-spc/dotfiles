{ pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull = {
        rebase = true;
        autostash = true;
      };
      rebase.autostash = true;
      credential = {
        "https://github.com".helper = "${lib.getExe pkgs.gh} auth git-credential";
        "https://gist.github.com".helper = "${lib.getExe pkgs.gh} auth git-credential";
      };
      merge.conflictstyle = "diff3";
      advice.addIgnoredFile = false;
    };
  };
}
