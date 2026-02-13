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

## Development Setup

<details>
<summary>Click to expand for detailed instructions</summary>

### Shell Configuration

The repository includes configuration for multiple shells to ensure a consistent experience across platforms.

</details>

## Supported configuration

### Shells

- [Bash](https://www.gnu.org/software/bash/) 🐧 : [`~/.bashrc`](./home/dot_bashrc)
- [Z shell](http://zsh.sourceforge.net/) 🐧 : [`~/.zshrc`](./home/dot_zshrc.tmpl) _<sup>enhanced with [**Oh-My-Zsh**](https://ohmyz.sh/)</sup>_
- [[WIP] PowerShell 5.1+](https://github.com/PowerShell/PowerShell) 🐧⊞ : [`~/.config/powershell/`](./home/private_dot_config/powershell/) _<sup>enhanced with [**Oh-My-Posh**](https://github.com/JanDeDobbeleer/oh-my-posh), [[WIP] **Terminal Icons**](https://github.com/devblackops/Terminal-Icons)</sup>_

### Terminals

- [iTerm2](https://iterm2.com/) : [`~/.config/iterm/`](./dot_config/iterm)
- [macOS Terminal](https://support.apple.com/en-ca/guide/terminal/welcome/mac)
- [[WIP] Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701) ⊞: [`~/.config/windows_terminal/`](./dot_config/windows_terminal)

### Package managers

All packages are installed with [Homebrew](https://brew.sh/)  and [[WIP] Chocolatey](https://chocolatey.org/) ⊞

Package list can be fould here : [Packages.toml](./home/.chezmoidata/packages.toml)

## Bitwarden CLI Setup

This repository uses the [Bitwarden CLI](https://bitwarden.com/help/cli/) (`bw`) to manage secrets in your dotfiles templates. The CLI is automatically installed during initial setup, but you'll need to authenticate.

### First-Time Setup

1. **Login to Bitwarden**:
   ```bash
   bw login your-email@example.com
   ```
   This will prompt you for your master password and generate a session token.

2. **Generate and Export Session Token**:
   ```bash
   export BW_SESSION="$(bw unlock --raw)"
   ```
   This command unlocks your vault and exports the session token, which allows ChezMoi templates to access your secrets without additional prompts.

3. **Verification**:
   ```bash
   chezmoi apply --dry-run
   ```
   This will show you what changes will be made without actually applying them. If your Bitwarden connection is working, you'll see rendered secrets from your vault.

### Environment Setup

- **Automatic Session**: The `.zshrc` template includes logic to automatically set `BW_SESSION` if you have an authenticated Bitwarden session.
- **Manual Setup**: If you prefer manual control, you can set `BW_SESSION` in your shell profile or use a secure environment variable storage solution.
- **Session Security**: Treat `BW_SESSION` like a password. Consider storing it in your system keychain rather than in plain text in shell configs.

### Usage in Templates

Secrets in templates are accessed via ChezMoi's Bitwarden template functions. Examples:
- `{{ (bitwarden "item" "ITEM_ID").login.username }}`  - Get login username
- `{{ (bitwardenFields "item" "ITEM_ID").fieldName.value }}` - Get custom field
- `{{ (bitwardenAttachment "filename" "ITEM_ID") }}` - Get file attachment (e.g., SSH keys)

See [.github/agents/ChezMoi.agent.md](./.github/agents/ChezMoi.agent.md) for detailed template examples.

---

Inspired by: [twpayne](https://github.com/twpayne/dotfiles) / [natelandau](https://github.com/natelandau/dotfiles) / [renemarc](https://github.com/renemarc/dotfiles)