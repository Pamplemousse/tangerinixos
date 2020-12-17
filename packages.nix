{ config, pkgs }:

let
  openssl_102uIsAllowed =
    config.nixpkgs.config ? "permittedInsecurePackages" &&
    (builtins.any (x: x == "openssl-1.0.2u") config.nixpkgs.config.permittedInsecurePackages);

  pythonWithPackages = pkgs.python3.withPackages(ps: with ps; [
    binwalk
    capstone
    distorm3
    flask
    requests
    sqlmap
  ]);

in with pkgs; [
  aflplusplus
  aircrack-ng
  apktool
  arping
  atftp
  bettercap
  bluez
  bully
  burpsuite
  cabextract
  ccrypt
  checksec
  chkrootkit
  chntpw
  cifs-utils
  cowpatty
  crunch
  cutecom
  darkstat
  dcfldd
  dirb
  ddrescue
  dnsenum
  dnsrecon
  dnstracer
  driftnet
  dsniff
  enum4linux
  ettercap
  exiv2
  ext4magic
  extundelete
  fcrackzip
  fierce
  firefox
  flashrom
  foremost
  fping
  gdb
  gnuradio
  gobuster
  gpart
  gparted
  hashcat
  hashcat-utils
  hashdeep
  hivex
  hping
  httrack
  iodine
  iw
  jadx
  john
  kismet
  libfreefare
  libnfc
  lvm2
  lynis
  macchanger
  masscan
  mdbtools
  medusa
  metasploit
  mfcuk
  mfoc
  minicom
  miredo
  mlocate
  nasm
  nasty
  ncat
  netcat-gnu
  netmask
  netsniff-ng
  nfs-utils
  nmap
  neovim
  net-snmp
  onesixtyone
  openssh
  openvpn
  p0f
  p7zip
  parted
  pdfcrack
  pdf-parser
  pev
  php
  pixiewps
  proxychains
  pwnat
  pwndbg
  qemu
  radare2
  radare2-cutter
  rarcrack
  reaverwps
  recoverjpeg
  redsocks
  samba
  safecopy
  siege
  sipp
  sipsak
  sleuthkit
  spike
  sqlitebrowser
  ssdeep
  ssldump
  sslh
  sslsplit
  steghide
  swaks
  tcpdump
  tcpflow
  tcpreplay
  testdisk
  testssl
  thc-hydra
  theharvester
  tightvnc
  tmux
  udptunnel
  unrar
  utillinux
  volatility
  whois
  wfuzz
  wget
  wireshark
  wifite2
  wpscan
  yara
  zap

  pythonWithPackages
]
++ lib.optionals openssl_102uIsAllowed [ cadaver sslscan proxytunnel ]
