# During setup/install

- mkfs: Make (format) your filesystem
- mkswap: Make swap space
- mount: Mounts a drive (also useful during normal use)
- umount: Unmounts a drive (also useful during normal use)

# Command line

- fd: Display disk usage.
- enablegpu.sh: Custom script to turn on the NVIDIA drivers. Run with sudo.
- disablegpu.sh: Custom script to turn off the NVIDIA drivers. Run with sudo.
- nvidia-smi: Display nvidia graphics card information. Requires GPU to be enabled.

## Groups

- groupadd: Creates new groups
- gpasswd: Adds a user to a group

# Desktop

- <Control>space: dropdown Tilda.

# Tablet settings

To set a tablet to only control a single monitor, [ArchWiki](https://wiki.archlinux.org/index.php/wacom_tablet#xrandr_setup):

```
xsetwacom set 19 MapToOutput DP-3
```
