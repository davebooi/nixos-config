# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other home-manager modules here
  imports = [
    #inputs.sops-nix.homeManagerModules.sops

    # If you want to use modules your own flake exports (from modules/home-manager):
    # inputs.self.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  # home = {
  #   username = "dave";
  #   homeDirectory = "/home/dave";
  # };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [ 
    # browser
    firefox

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    #aria2 # A lightweight multi-protocol & multi-source command-line download utility
    #socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg


    # productivity
    #hugo # static site generator
    #glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    #swaybg # wallpaper
    #nautilus #file manager

    xwayland-satellite # xwayland support (niri)
    gtklock # screen locker (Super+Alt+L in niri default)
   ];

  #programs.fuzzel.enable = true;
  #programs.waybar.enable = true; # launch on startup in the default setting (bar)

  # Ensure a shell is enabled
  programs.zsh.enable = lib.mkDefault true;


  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        #family = "JetBrains Mono"; # managed via stylix
        #style = "Regular"; # managed via stylix
        # size = 13; # managed via stylix
      };
      colors.draw_bold_text_with_bright_colors = true;
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # enable git
  programs.git = {
    enable = true;
    settings.user = {
      name = "davebooi";
      email = "db@scurr.club";
    };
  };

  # load SSH keys into agent
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
    "github.com" = {
      hostname = "github.com";
      user = "git";
      identityFile = "~/.ssh/id_ed25519_github";
      identitiesOnly = true;  # don't try other keys
      };
    };
  };

  # # Set the ssh package to be the hardened version of itself
  # ssh.package = lib.mkDefault (harden pkgs.openssh);


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";


  # niri window manager and noctalia shell
  home.file.".config/niri".source = ./niri;
  #xdg.configFile."niri/config.kdl" = { source = niri/config.kdl; force = true; };
  #xdg.configFile."niri/noctalia.kdl" = { source = niri/noctalia.kdl; force = true; };

  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit
  

  # rofi launcher
  programs.rofi = {
    enable = true;
    theme = lib.mkForce "sidebar";
    # font = "sans-serif";
    package = pkgs.rofi;
    modes = [
      "drun"
      "run"
      "window"
      "ssh"  
    ];
    extraConfig = {
      show-icons = true;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.11";
}
