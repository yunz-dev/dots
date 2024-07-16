# Configuartion Files

Repository containing my dot files and system files

## Dependencies

### Git
### Stow

## Installation

Clone the reposity in your $HOME directory
```
$ git clone git@github.com:yunz-dev/dots.github
$ cd dots
```
Use stow to create symlinks
```
$ stow .
```
### NixOS 
copy configuration file to `/etc/nixos/configuration.nix`
run 
```bash
sudo nixos-rebuild switch
```
when making changes:
```bash
`~/scripts/INSERT_NIXOS_SCRIPT_HERE`
```



