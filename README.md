# My dotfiles

Cross-platform, cross-shell dotfiles powered by [chezmoi](https://www.chezmoi.io/) 🏠

Universal command set and colourful shell configurations for Bash, Zsh and Powershell, compatible with macOS, Windows and (partially) Linux, all managed easily using [chezmoi](https://github.com/twpayne/chezmoi).


## Setup a new machine

### MacOs / Linux / Windows
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply FSLEF
```

## Project goals

- Environment is personalized based on whether the machine is for personal or work use and tailored to its intended role (development and/or Docker).
- Automatic package management and updates.
- Application configuration.
- Cross-platform and cross-shell terminal aliases.

## Supported configuration

### Shells

-   [Bash](https://www.gnu.org/software/bash/) <sub><sup><b title="Linux">🐧</b></sup></sub><b title="macOS"></b>: [`~/.bashrc`](./dot_bashrc)
-   [Z shell](http://zsh.sourceforge.net/) <sub><sup><b title="Linux">🐧</b></sup></sub><b title="macOS"></b>: [`~/.zshrc`](./dot_zshrc) _<sup>enhanced with [**Oh-My-Zsh**](https://ohmyz.sh/)</sup>_
-   [==[WIP]==PowerShell 5.1+](https://github.com/PowerShell/PowerShell) <sub><sup><b title="Linux">🐧</b></sup></sub><b title="macOS"></b><b title="Windows">⊞</b>: [`~/.config/powershell/`](./dot_config/powershell/) _<sup>enhanced with [**Oh-My-Posh**](https://github.com/JanDeDobbeleer/oh-my-posh), [**Terminal Icons**](https://github.com/devblackops/Terminal-Icons)</sup>_

### 💻 Terminals

-   [iTerm2](https://iterm2.com/) <b title="macOS"></b>: [`~/.config/iterm/`](./dot_config/iterm)
-   [macOS Terminal](https://support.apple.com/en-ca/guide/terminal/welcome/mac) <b title="macOS"></b>
-   [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701) <b title="Windows">⊞</b>: [`~/.config/windows_terminal/`](./dot_config/windows_terminal)

### 📦 Package managers

All packages are installed with [Homebrew](https://brew.sh/) <b title="macOS"></b> and [Chocolatey](https://chocolatey.org/) <b title="Windows">⊞</b>
Package list can be fould here : [Packages.toml](./home/.chezmoidata/packages.toml)