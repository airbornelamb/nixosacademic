# nixosacademic
Bootstrap Nixos setup for academic writing on a new machine

### Initial NixOs install

```bash
cfdisk /dev/sda
  # create a new gpt filesystem
  # create 1M partition /dev/sda1 of type "bios boot"
  # create remaining space as /dev/sda2 of type "linux"
mkfs.ext4 -L nixos /dev/sda2
mount /dev/disk/by-label/nixos /mnt
nixos-generate-config --root /mnt
curl https://raw.githubusercontent.com/airbornelamb/nixosacademic/master/configuration.nix -o /mnt/etc/nixos/configuration.nix
nixos-install
# change root passwd
reboot
```

Then login as user "josh" with password "changeme"

```
cd ~
wget https://github.com/airbornelamb/nixosacademic/archive/master.zip
7z x master.zip
cp -r nixosacademic-master/. .
```

after this finishes you must reopen the shell and let it do it's thing, then logout and login again
