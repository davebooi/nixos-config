{
  pkgs,
  user,
  ...
}:

{
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "25.11";

  imports = [

    ../modules/hm/git.nix
    #../modules/hm/waybar.nix
    ../modules/hm/stylix.nix
    ../modules/hm/noctalia.nix
    ../modules/hm/swayidle.nix
    ../modules/hm/cliphist.nix
    # ../modules/hm/niri.nix
  ];

  programs.bash = {
    enable = true;
    shellAliases ={
      cat = "bat";
      cls = "clear";
      ls = "lsd";
      grep = "rg";
    };
  };

  home.packages = with pkgs; [
    # essential apps and services^
    grimblast
    adwaita-icon-theme # for GTK apps
    playerctl

    # GUI
    mpv
    #nautilus
    xfce.thunar

    # TUI
    yazi
    lazygit
    #eza # A modern replacement for ‘ls’
    #pass

    # nix related
    # it provides the command `nom` works just like `nix` with more details log output
    nix-output-monitor

    # rust alternatives to unix commands
    lsd
    bat
    fzf
    ripgrep

    #messenger
    signal-desktop
    altus

    #todoist
    todoist-electron
  ];

  
}