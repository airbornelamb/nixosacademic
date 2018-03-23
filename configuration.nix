# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running â€˜nixos-helpâ€™).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
   boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  hardware.pulseaudio.enable = true;
  virtualisation.virtualbox.host.enable = true;

  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "us";
     defaultLocale = "en_US.UTF-8";
   };

  # Set your time zone.
   time.timeZone = "America/Detroit";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
   environment.systemPackages = with pkgs; [
     wget git curl aria tmux zsh p7zip vim zip unzip python3Full
     xclip parcellite 
     haskellPackages.pandoc haskellPackages.pandoc-citeproc
     sakura st rxvt_unicode-with-plugins conky
     geany sshfs cifs-utils virtualbox zotero firefox
     openbox obconf openbox-menu slim docker docker_compose
     numix-gtk-theme numix-icon-theme papirus-icon-theme
     gtk-engine-murrine gdk_pixbuf cairo librsvg lxappearance
     fira gohufont roboto hack-font font-awesome-ttf liberation_ttf
     xfce.thunar xfce.thunar-archive-plugin xfce.thunar_volman
     xfce.mousepad
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.bash.enableCompletion = true;
   programs.mtr.enable = true;
   programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
   programs.zsh.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
   services.printing.enable = true;

  # Enable the X11 windowing system.
   services.xserver.enable = true;
   services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";


  # Enable touchpad support.
    services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
    services.xserver.desktopManager.xterm.enable = false;
    services.xserver.displayManager.slim.enable = true;
    services.xserver.windowManager.openbox.enable = true;
    services.xserver.windowManager.default = "openbox";
  # Define a user account. Don't forget to set a password with â€˜passwdâ€™.
   users.extraUsers.josh = {
     isNormalUser = true;
     home = "/home/josh";
     shell = "${pkgs.zsh}/bin/zsh";
     uid = 1000;
     description = "Josh Lamb";
     extraGroups = [ "users" "wheel" "input"];
     initialPassword = "changeme";
   };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "17.09"; # Did you read the comment?

}

