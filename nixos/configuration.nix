# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Default Applications
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";





  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  fonts.packages = with pkgs; [
  nerdfonts
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
];




  #Enable zsh 
  ## for global user
  users.defaultUserShell=pkgs.zsh; 
  environment.shells = with pkgs;  [zsh ];
  # enable zsh and oh my zsh

  programs = {
     zsh = {
        enable = true;
        autosuggestions.enable = true;
        zsh-autoenv.enable = true;
        syntaxHighlighting.enable = true;
        ohMyZsh = {
           enable = true;
           theme = "robbyrussell";
           plugins = [
             "git"
             "npm"
             "history"
             "node"
             "rust"
             "deno"
           ];
        };
     };
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "au";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yunz = {
    isNormalUser = true;
    description = "yunz";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    foot
    alacritty
    obsidian
    pkgs.gnome3.gnome-tweaks
    pkgs.home-manager
    neofetch
    discord
    vscode
    mpv
    btop
    gimp
    ungoogled-chromium
    ### IMPORTANT
    zsh
    sshfs
    git
    wget
    tigervnc
  #  wget
    ### CLI TOOLS -----------------------------------------------
    fzf # fuzzy finder
    lazygit
    fd # replace fzf command with this
    neovim 
    tmux
    yazi # file manager
    bottom # top alternative
    zoxide # cd alternative
    bat # cat alternative
    delta
    eza # ls alternative
    thefuck # fix typos
    tldr # man alternative
    delta #
    fastfetch # neofetch alternative
    stow
    tree


    ### Programming Languages -----------------------------------
    bash
    nodejs_22 
    python3
    python312Packages.pip

#    rustc
#    pkg-config
    rustup
#    cargo
#    openssl
#    openssl.dev

    gcc
    clang
    jdk
    # jetbrains.rider
    dotnet-sdk
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

#environment.variables = {
#    OPENSSL_DIR = "${pkgs.openssl.dev}";
#    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
#    OPENSSL_LIB_DIR = "${pkgs.openssl.dev}/lib";
#    OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";
#  };

}

