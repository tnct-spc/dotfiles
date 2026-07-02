{
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      config.global.log_filter = "^(loading|unloading)";
    };
  };
}
