# Configuartion Files

Repository containing my dot files and system files

## Dependencies

### Git
clone and version control
### Stow
needed to create symlinks
### Zsh
add `ssh.sh` to `scripts/secrets/` for custom ssh alias'
### Hyprland
run `chmod +x start.sh` in `hypr` directory
## Installation

Clone the repository in your $HOME directory
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

TODO: custom nix shell scripts under scripts dir



