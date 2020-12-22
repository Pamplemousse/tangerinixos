{ config, pkgs, ... }:
let
  # Get the host configuration from which some values can be used as defaults:
  # locale, keyboard layout, timezone...
  hostConfiguration = (import /etc/nixos/configuration.nix) { inherit config pkgs; };

  user = rec {
    name = "rpaulson";
    value = {
      password = "toor";
      extraGroups = [ "networkmanager" "wheel" ];
      home = "/home/${user.name}";
      isNormalUser = true;
      uid = 1000;
    };
  };
in
{
  console = {
    font = "Fura Code Regular Nerd Font Complete Mono";
    keyMap = hostConfiguration.console.keyMap;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = import ./packages.nix { inherit config pkgs; };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [ nerdfonts ];
  };

  i18n = hostConfiguration.i18n;

  networking = {
    extraHosts =
      let
        hostsPath = https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts;
        hostsFile = builtins.fetchurl hostsPath;
      in
      builtins.readFile "${hostsFile}";

    hostName = "tangerinixos";

    # Default to OpenDNS.
    nameservers = [ "208.67.222.222" "208.67.220.220" ];
  };

  time = hostConfiguration.time;

  services.sshd.enable = true;

  services.xserver = {
    enable = true;

    displayManager.autoLogin = {
      enable = true;
      user = user.name;
    };
    displayManager.lightdm.enable = true;
    desktopManager.mate.enable = true;

    libinput.enable = true;

    layout = hostConfiguration.services.xserver.layout;
    xkbVariant = hostConfiguration.services.xserver.xkbVariant;
  };

  system.stateVersion = config.system.nixos.release;

  users.extraUsers = builtins.listToAttrs [ user ];

  virtualisation.memorySize = 800;
}
