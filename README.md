# My Dotfiles

> [!NOTE]
> **This repository houses cross-platform dotfiles managed with [chezmoi](https://www.chezmoi.io/) 🏠.**


### Setup a new machine (all os)

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply FSLEF
```

## Key Features

- **Customized Environment**: Tailored for both personal and professional use, optimized for development and Docker workflows.
- **Automated Package Management**: Enjoy hassle-free installations and updates.
- **Streamlined Application Configuration**: Simplifies setup to deliver a consistent experience.
- **Universal Terminal Aliases**: Ensures a uniform command experience across all platforms and shells.
- **Security First**: Pre-commit hooks prevent accidental commit of secrets and sensitive data.

## Development Setup

<details>
<summary>Click to expand for detailed instructions</summary>

### Pre-commit Hooks

This repository uses pre-commit hooks to ensure code quality and security. To set up:

1. Install pre-commit:
   ```bash
   # macOS
   brew install pre-commit

   # Windows
   choco install pre-commit
   ```

2. Install the git hooks:
   ```bash
   pre-commit install
   ```

3. Run against all files (first time):
   ```bash
   pre-commit run --all-files
   ```

The hooks include:
- Secret scanning using detect-secrets
- Shell script linting with shellcheck
- PowerShell script analysis with PSScriptAnalyzer

### Secret Scanning

The repository uses [detect-secrets](https://github.com/Yelp/detect-secrets) to prevent accidental commit of secrets. The baseline file (`.secrets.baseline`) contains known false positives and whitelisted patterns.

To update the baseline after adding new false positives:
```bash
detect-secrets scan > .secrets.baseline
```
</details>

## Supported configuration

### Shells

- [Bash](https://www.gnu.org/software/bash/) 🐧 : [`~/.bashrc`](./home/dot_bashrc)
- [Z shell](http://zsh.sourceforge.net/) 🐧 : [`~/.zshrc`](./home/dot_zshrc.tmpl) _<sup>enhanced with [**Oh-My-Zsh**](https://ohmyz.sh/)</sup>_
- [[WIP] PowerShell 5.1+](https://github.com/PowerShell/PowerShell) 🐧⊞ : [`~/.config/powershell/`](./home/private_dot_config/powershell/) _<sup>enhanced with [**Oh-My-Posh**](https://github.com/JanDeDobbeleer/oh-my-posh), [[WIP] **Terminal Icons**](https://github.com/devblackops/Terminal-Icons)</sup>_

### Terminals

- [iTerm2](https://iterm2.com/) : [`~/.config/iterm/`](./dot_config/iterm)
- [macOS Terminal](https://support.apple.com/en-ca/guide/terminal/welcome/mac) 
- [[WIP] Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701) ⊞: [`~/.config/windows_terminal/`](./dot_config/windows_terminal)

### Package managers

All packages are installed with [Homebrew](https://brew.sh/)  and [[WIP] Chocolatey](https://chocolatey.org/) ⊞

Package list can be fould here : [Packages.toml](./home/.chezmoidata/packages.toml)


---

Inspired by: [twpayne](https://github.com/twpayne/dotfiles) / [natelandau](https://github.com/natelandau/dotfiles) / [renemarc](https://github.com/renemarc/dotfiles)