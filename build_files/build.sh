#!/bin/bash

set -ouex pipefail
### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
dnf -y copr enable gmaglione/podman-bootc
dnf -y copr enable ublue-os/packages
#dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo

# development and CLI tools

dnf install -y --allowerasing \
 btop \
 neovim \
 code \
 bash-completion \
 bcc-tools \
 strace \
 tmate 

 # Cockpit for system management and related packages
 dnf install -y --allowerasing \
 cockpit \
 cockpit-bridge \
 cockpit-composer \
 cockpit-files \
 cockpit-image-builder \
 cockpit-machines \
 cockpit-networkmanager \
 cockpit-ostree \
 cockpit-packagekit \
 cockpit-podman \
 cockpit-sosreport \
 cockpit-storaged \
 cockpit-system \
 cockpit-ws \
 cockpit-ws-selinux 

 # podman and related tools
 dnf install -y --allowerasing \
 podman-machine \
 podman-compose \
 podman-tui \
 podmansh \
 podlet \
 docker-buildx-plugin \
 docker-ce docker-ce-cli \
 docker-compose-plugin \
 docker-model-plugin \
 kubectl \
 distrobox \
 podman-bootc \
 flatpak-builder

 #Desktop tools and utilities
 dnf install -y --allowerasing \
 virt-manager \
 jetbrains-mono-fonts-all \
 gnome-tweaks \
 gvfs-smb \
 uupd \
 gnome-shell-extension-dash-to-dock \
 gnome-shell-extension-appindicator \
 tailscale 
#remove firefox

dnf -y remove firefox
dnf -y clean all
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#dnf -y copr enable gmaglione/podman-bootc
#dnf -y install podman-bootc
dnf -y copr disable gmaglione/podman-bootc
#dnf -y copr enable ublue-os/packages
#dnf -y install uupd
dnf -y copr disable ublue-os/packages

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable cockpit.socket
systemctl enable docker.socket
systemctl enable libvirtd
systemctl enable tailscaled
