# Packer Images

* currrently only tested for Ubuntu 16.04.4 LTS, but can easily be extended to other versions with little to no modifications to the packer.json file


## Requirements

* [Packer](https://www.packer.io/)

* upload your Ubuntu server ISO to the iso directory
* enter in the ISO name, checksum and checksum type in the packer.json variables block at the top for the appropriate variables


### TODO

Currently `guest_additions_mode` is set to `disabled` and just updating `virtualbox-guest-utils` via `apt-get`, but plan to get the VBoxAdditions.iso version installed during the provisioning step instead


#### Misc Notes

```
    {
      "type": "shell",
      "inline": [
        "sudo mkdir /media/iso",
        "sudo mount VBoxGuestAdditions.iso /media/iso",
        "sudo sh -eux /media/iso/VBoxLinuxAdditions.run || echo 'exit code suppressed'",
        "sudo umount /media/iso",
        "rm -Rf ~/*.iso"
      ]
    }
```
