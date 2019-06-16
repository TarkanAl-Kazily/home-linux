# Notes from installing Arch

## Partitioning

Initially my XPS came with Windows 10, so I first resized the Windows partition
to take up ~120 GB space, freeing up 350 GB for Linux.

## Boot settings

Followed XPS specific settings.
Menu reached from pressing F2.

- Disabled Secure Boot
    - Required disabling Bitlocker (encrypted file system) in the Window's partition
- Configured SATA mode to be AHCI
    - Required configuring Windows 10 to be compatible with AHCI
- Changed Fastboot to Thorough boot

## USB iso settings

Followed directions to format thumbdrive with Arch installer image.
Used `dd` command that can be very dangerous if done on your active hard drive.

## Boot Arch from USB

Boot menu reached from pressing F12.

### Wifi

`wifi-menu` from initial setup will have a convenient menu for connecting
to the Internet.

### Linux Partitions

| Total     | ~336 GB | #  |
| --------- | ------- | -- |
| /         |  64 GB  |  7 |
| SWAP      |  24 GB  |  8 |
| /var      |  48 GB  |  9 |
| /home     | 200 GB  | 10 | 

Used fdisk to create _n_ew partitions.
When partitioning we set their _t_ype to 'Linux filesystem' or 'Linux swap'
accordingly.
Used mkfs to create ext4 filesystems with appropriate _L_abels.
Used mkswap to create swap space.

`mount` partitions to /mnt
- Use it for root
- mkdir's for /var, /home, /boot
- mount EFI partition (already exists) to /boot

df - report file system disk space usage

### Install Arch

Checked the mirror list, giving it a rough sort by proximity.

Then install base packages to root partition (mounted under /mnt) using
```
$ pacstrap /mnt base
```

### Configure the system

- fstab file: file system table
- change root using chroot
- Set time zone
- Set language localization
- Set network configuration.
    - Relevant man pages: hosts(5), hostname(7)
- Don't need to initramfs
- Set root password
    - Note: Can be redone through mounting fs using a boot drive.

### Boot Loader

- Need boot loader compatible with
    - UEFI
    - Multiboot
    - /boot partition filesystem

Chose systemd-boot for simplicity.

Installed efivar to check EFI variables.
Installed systemd-boot using
```
$ bootctl --path=/boot install
```
Updated EFI boot manager using `bootctl update`.

Set loader configuration in `/boot/loader/loader.conf`
- default: specifices the entry to select; arch
- timeout: specifies how long to wait for; 3 (seconds)

Added loader for arch in `/boot/loader/entries/arch.conf`
- title: The name of the OS; Arch Linux
- linux: /vmlinuz-linux
- initrd: /initramfs-linux.img
- options: root=UUID=.... rw
    - Referred to by UUID for guarantee of what partition to use in the
    event of multiple partitions with the same label.
bootctl automatically checks at boot for Windows Boot Manager, allowing
easy dual booting into Windows.

## Rebooting Arch

# Dual Booting notes

Disable Windows Fast Startup

# Dell XPS 15 specific notes

## Backlight

Installed a new version of xbacklight
