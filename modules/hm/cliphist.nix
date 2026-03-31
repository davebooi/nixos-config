{ pkgs, inputs, lib, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    wl-clip-persist
  ];

  systemd.user.services.wl-clip-persist = {
    Unit = {
      Description = "Keep Wayland clipboard even after programs close";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard both";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  services.cliphist = {

      enable = true;

      systemdTargets = [ "graphical-session.target" ];

      extraOptions = [
        "-max-dedupe-search"
        "10"
        "-max-items"
        "500"
      ];
      allowImages = true;

    };
}