# Dual Boot Ubuntu 26.04 and ChromeOS on Acer Chromebook Plus 514

- Model: Acer Chromebook Plus 514 (CB514-3HT-R2QQ), board name MARKARTH
- Platform: AMD Mendocino (Ryzen 3 7320C)
- Installation date: August 2026

I wanted to run Ubuntu on my Chromebook while keeping ChromeOS as a fallback.

I used the RW_LEGACY dual boot method — no hardware modification needed.

I followed these guides:
- https://docs.mrchromebox.tech/docs/getting-started.html
- https://docs.chrultrabook.com/docs/installing/dualboot.html
- https://github.com/chrultrabook/crap

## Preparation

Backup all local data — enabling Developer Mode wipes the device.

Optionally create a ChromeOS recovery USB stick in case you need to restore:
- Download and run the [Chromebook Recovery Utility](https://chrome.google.com/webstore/detail/chromebook-recovery-utili/pocpnlppkickgojjlmhdmidojbmbodfm).

Verify your device has RW_LEGACY support:
- https://docs.mrchromebox.tech/docs/supported-devices.html
- The Acer Chromebook Plus 514 (MARKARTH) is confirmed supported.

Prepare a bootable Ubuntu USB stick on another machine.

## Enable Developer Mode

Press `Esc + Refresh + Power` to enter recovery mode, then go to `Advanced Settings` and select `Developer Mode`. 

The device will wipe itself and reboot — this takes about 10 minutes.

Do not log in with your Google account. Do not use guest mode.

## Step 1 — Repartition the disk with CRAP

Boot from internal disk. 

At the ChromeOS login screen, do not log in.

Use the Wifi setup on the bottom right corner to enable internet.

Then press `Ctrl+Alt+Refresh(F2)` to switch to VT2.

Log in as `chronos` with no password.

```
curl -L https://tinyurl.com/crap-cb-01 -o /tmp/crap.sh
cp /tmp/crap.sh /run/crap.sh
sudo -i
SUDO_USER="" bash /run/crap.sh
```

In the CRAP menu, choose `1` to resize the stateful partition.

Enter `50G` to give ChromeOS 50GB, leaving ~185GB free for Ubuntu.

Reboot when done.

## Step 2 — Install RW_LEGACY firmware

Still in Developer Mode, boot from internal disk. 

At the ChromeOS login screen, do not log in.

Use the Wifi setup on the bottom right corner to enable internet.

Then press `Ctrl+Alt+Refresh(F2)` to switch to VT2.

Log in as `chronos` with no password.

```
curl -L https://github.com/MrChromebox/scripts/raw/main/firmware-util.sh \
  -o /tmp/firmware-util.sh && sudo bash /tmp/firmware-util.sh
```

Select option `1` — Install/Update RW_LEGACY Firmware. 

Confirm with `y`.

Press `R` to reboot when done.

## Step 3 — Boot Ubuntu USB

At the developer mode boot screen, select **Select alternate bootloader**, then **edk2**.

This launches the RW_LEGACY firmware which boots your USB stick.

## Step 4 — Install Ubuntu

In the Ubuntu installer, choose **Manual partitioning**:

- Note the ~185GB unallocated space: format as `ext4`, mount point `/`
- The existing `nvme0n1p12` (64MB) was automatically assigned as `/boot/efi`
- Set device for bootloader installation to `/dev/nvme0n1`

Proceed with installation normally.

## Booting after installation

At the developer mode screen on every boot:
- `Ctrl+L` should boot into Ubuntu via RW_LEGACY
- `Ctrl+D` (or wait) → boots ChromeOS

## Notes

- The SUDO_USER="" trick is needed because `sudo -i` sets that variable,
  which CRAP detects and rejects
- `/tmp` is a noexec mount on ChromeOS; copy scripts to `/run` before executing

## See also

- Post-install checklist: https://github.com/christianepeters/howto/blob/master/ubuntu-config.md
