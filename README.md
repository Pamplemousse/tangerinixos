# securitix

[NixOS](https://nixos.org/) tailored for pentesting.

Think [Kali](https://www.kali.org/) / [Parrot](https://parrotlinux.org/), but being a customisation of [NixOS](https://nixos.org/) instead of being based on Debian.


## How to use

It is meant to be installed and used from a [NixOS](https://nixos.org/) host, in a [qemu](https://www.qemu.org/) virtual machine.

```
# Pull the configuration
git clone git@github.com:Pamplemousse/securitix.git
# Build the VM
sudo nixos-rebuild -I nixos-config=./securitix.nix build-vm
# Run the VM using the generated script
./result/bin/run-securitix-vm
```

## Limitations

  * **VM configuration**:
    Is defined by the `nixos-rebuild build-vm` command, with no control over the image parameters, or the starting script.
    It would be great to be able to allocate more resources to the VM, or define alternative networking options.
  * **Customizability**:
    It requires manual editing of files after the `clone`. It would be nice to offer higher level options.
  * **Lack of packages**:
    [Are We Hackers Yet?](https://jjjollyjim.github.io/arewehackersyet/index.html) keeps track of the effort of bringing Kali packages into [`Nixpkgs`](https://github.com/NixOS/Nixpkgs).
    Not all are yet available, but it's getting there!
    Be part of the effort by contributing to [NixOS for Pentesting Overview](https://github.com/NixOS/nixpkgs/issues/81418).
  * **Too many packages (for maintenance)**:
    Not all the packages from Kali available in [`Nixpkgs`](https://github.com/NixOS/Nixpkgs) evaluates properly...
    Increasing the number of packages for `securitix` implies increasing the risk of evaluation (hence building) failures.
