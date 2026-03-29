{ pkgs, inputs, ... }:
{
  # ...

  home-manager.users.drfoobar = {
    # ...
    programs.niri = {
      package = niri;
      settings = {
        # ...
        spawn-at-startup = [
          {
            command = [
              "noctalia-shell"
            ];
          }
        ];
      };
    };
  };
}