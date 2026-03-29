{ pkgs, inputs, ... }:
{
  # ...

  home-manager.users.dave = {
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