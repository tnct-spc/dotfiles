{ inputs, pkgs, ... }:
{
  imports = [ inputs.xremap-flake.homeManagerModules.default ];

  services.xremap = {
    enable = true;
    package = pkgs.xremap;
    watch = true;
    config = {
      modmap = [
        {
          name = "CapsLock as virtual modifier";
          remap.CapsLock = {
            held = "CapsLock";
            alone = "Esc";
          };
        }
      ];

      virtual_modifiers = [ "CapsLock" ];

      keymap = [
        {
          name = "CapsLock navigation";
          remap = {
            "CapsLock-e" = "Esc";
            "CapsLock-LeftBrace" = "Delete";
            "CapsLock-RightBrace" = "Backspace";
            "CapsLock-SemiColon" = "Enter";
            "CapsLock-h" = "Left";
            "CapsLock-j" = "Down";
            "CapsLock-k" = "Up";
            "CapsLock-l" = "Right";
          };
        }
      ];
    };
  };
}
