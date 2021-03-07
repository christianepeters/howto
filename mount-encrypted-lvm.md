# Mount Encrypted LVM

1. Start Ubuntu 20.04 live CD from USB.

2. Check name of encrypted partition:
```
$ lsblk -f
NAME        FSTYPE      LABEL                    UUID                                 FSAVAIL FSUSE% MOUNTPOINT
nvme0n1                                                                                     
└─nvme0n1p6 crypto_LUKS                          XXX
```
3. Unlock encrypted partition:
```
cryptsetup open --type luks /dev/nvme0n1p6 crypto_LUKS
Enter passphrase for /dev/nvme0n1p6:
```

4. Check volumes:
```
$ sudo vgscan
  Found volume group "vg0" using metadata type lvm2
```

5. Enable logical volumes in volume group (here `vg0`):
```
$ sudo vgchange -a y vg0
  4 logical volume(s) in volume group "vg0" now active
```

6. Now I see the following:
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


