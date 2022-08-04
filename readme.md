<h1 align="left">DEBIAN-GX</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=for-the-badge">
  <img src="https://img.shields.io/github/license/xi72yow/DEB-GX?style=for-the-badge">
  <img src="https://img.shields.io/github/stars/xi72yow/DEB-GX?style=for-the-badge">
  <img src="https://img.shields.io/github/forks/xi72yow/DEB-GX?color=teal&style=for-the-badge">
  <img src="https://img.shields.io/github/issues/xi72yow/DEB-GX?color=violet&style=for-the-badge">
</p>

![DEB-GX logo](./branding-dev/dark.png#gh-dark-mode-only)
![DEB-GX logo](./branding-dev/light.png#gh-light-mode-only)

## Waht is DEB-GX

DEB GX short for (Debian Gnome Xi72yow) is an pre configured Debian System with Gnome Desktop. This Debian Spin is ready to Work an Fun. If you are interested see this Video or try it by yourself.

## Usage

0. Download the latest Version of DEB-GX from this repo
1. Flash the deb-gx_0.1.0.iso to an USB Stick. For Example [balenaEtcher](https://www.balena.io/etcher/) or [popsicle](https://github.com/pop-os/popsicle) can do this job.
2. Boot from the flashed USB
3. Enter LIVE Version of DEB-GX
4. Install with Grafical Installer

### Administrate to create your own Spin

In order to create your own Debian spin, it is advisable to test and work with Linux as the operating system for some time. When creating your own, largely customized spin, some configuration files must be placed in the right place in the right format. How DEB-GX is built is explained in the following steps.

<details><summary><b>Show instructions</b></summary>

0. clone this repo and go into it

   ```sh
   git clone https://github.com/xi72yow/DEBIAN-GX.git
   cd DEBIAN-GX
   ```

1. make the admin script executeabele

   ```sh
   chmod +x ./admin/dgxa
   ```

2. download all needed files

   ```sh
   chmod +x ./admin/dgxa
   ```

3. set calamares

   ```sh
   ./admin/dgxa sc
   ```

4. set login screen

   ```sh
   ./admin/dgxa sl
   ```

5. set login plymouth

   ```sh
   ./admin/dgxa sp
   ```

6. install dev dependencies

   ```sh
   sudo ./admin/dgxa id
   ```

6. build DEBIAN-GX

   ```sh
   sudo ./admin/dgxa b
   ```

</details>
