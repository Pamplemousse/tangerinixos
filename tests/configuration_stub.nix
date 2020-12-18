/*
    A fake host configuration containing attributes;
    On which the build of the TangerinixOS guest relies on.
*/
{ config, pkgs, ... }:
{
  console.keyMap = "fr-bepo";
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Amsterdam";
  services.xserver = {
    layout = "fr";
    xkbVariant = "bepo";
  };
}
