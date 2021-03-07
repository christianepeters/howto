# Mount Encrypted LVM

1. Enter BIOS, disable Secure Boot and Disable Fast Boot for Windows. Also if not fixed automatically, swap boot order of Ubuntu and Windows.

2. Start Ubuntu 20.04 live CD from USB.

3. Check name of encrypted partition:
```
$ lsblk -f
NAME        FSTYPE      LABEL                    UUID                                 FSAVAIL FSUSE% MOUNTPOINT
nvme0n1                                                                                     
└─nvme0n1p6 crypto_LUKS                          XXX
```
4. Unlock encrypted partition:
```
sudo cryptsetup open --type luks /dev/nvme0n1p6 CryptDisk
Enter passphrase for /dev/nvme0n1p6:
```

5. Check volumes:
```
$ sudo vgscan
  Found volume group "vg0" using metadata type lvm2
```

6. Enable logical volumes in volume group (here `vg0`):
```
$ sudo vgchange -a y vg0
  4 logical volume(s) in volume group "vg0" now active
```

7. Now I see the following:
```
$ lsblk -f
NAME               FSTYPE      LABEL                    UUID                                   FSAVAIL FSUSE% MOUNTPOINT

└─nvme0n1p6        crypto_LUKS                          XXX
  └─crypto_LUKS    LVM2_member                          XXX
    ├─vg0-lv0_swap swap                                 XXX
    ├─vg0-lv0_root ext4                                 XXX
    ├─vg0-lv0_home ext4                                 XXX
    └─vg0-lv0_scratch
```

8. Mount
```
sudo mount /dev/mapper/vg0-lv1_root /mnt
sudo mount /dev/nvme0n1p5 /mnt/boot
sudo mount /dev/nvme0n1p1 /mnt/boot/efi
sudo mount --bind /dev /mnt/dev
sudo chroot /mnt
```
9. Bind `proc`, `sys`, and `pts`:
```
mount -t proc proc /proc
mount -t sysfs sys /sys
mount -t devpts devpts /dev/pts
```
10. Update grub
```
grub-install
update-grub
```


