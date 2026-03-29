{
  pkgs,
  user,
  ...
}:

{
  home.username = user;
  home.homeDirectory = "/home/${user}";

  imports = [
    # ../modules/hm/hyprland.nix
    ../modules/hm/git.nix
    # ../modules/hm/zen-browser.nix
    # ../modules/hm/kitty.nix
    # ../modules/hm/nixcord.nix
    # ../modules/hm/swww.nix
    ../modules/hm/waybar.nix
    ../modules/hm/stylix.nix
    ../modules/hm/noctalia.nix
    ../modules/hm/swayidle.nix
    ../modules/hm/cliphist.nix
    # ../modules/hm/helix.nix
    # ../modules/hm/fish.nix
    # ../modules/hm/obsidian.nix
    # ../modules/hm/zed.nix
    # ../modules/hm/zellij.nix
    # ../modules/hm/wofi.nix
    # ../modules/hm/fastfetch.nix
    # ../modules/hm/dunst.nix
    # ../modules/hm/direnv.nix
  ];

  home.packages = with pkgs; [
    # essential apps and services
    grimblast
    #kitty
    #foot
    adwaita-icon-theme # for GTK apps
    playerctl

    # GUI
    #dragon-drop
    mpv
    #ente-auth
    #nautilus
    thunar

    # TUI
    yazi
    lazygit
    #pass

    # rust alternatives to unix commands
    lsd
    bat
    fzf
    ripgrep

    #messenger
    signal-desktop

    #todoist
    todoist-electron
  ];

  home.stateVersion = "25.11";
}