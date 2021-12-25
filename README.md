# Arch Linux Setup

Disclaimer: Scripts are under development and not stable!

## Getting started

### Download the image
On a working system, download the latest Arch Linux ISO from www.archlinux.org/download/.

### Set up the bootable USB drive
For an installation on a physical machine, chose a USB flash drive with at least 4GB storage capacity. Write the image to the USB flash drive, suitable applications are e. g. BalenaEtcher, Rufus, dd etc.
Alternatively, prepare a USB flash drive with Ventoy, which will make 2 partitions on the USB flash drive (one smaller partition for booting the Ventoy bootloader, and the other bigger partition for bootable images).

### Set up a virtual machine
For an installation on a virtual machine (VM), prepare the virtualization software. VMs can be set up with different virtualization applications like VirtualBox, VMware, QEMU etc. or on a hypervisor system. System resources on a VM are limited though. 
