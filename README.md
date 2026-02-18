# Dotfiles

Cross-platform dotfiles managed with [chezmoi](https://www.chezmoi.io/). The repo focuses on a consistent shell + Git setup, repeatable package installs, and secret-backed templates via Bitwarden.

> [!NOTE]
> This repo is designed to be applied with `chezmoi`. Most files under `home/` are templates (`*.tmpl`) and will be rendered into your `$HOME`.

## Getting started

### Bootstrap (macOS/Linux/Windows)

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply FSLEF
```

During init, chezmoi prompts for machine flags (personal/work/dev/docker) and a Git email (see [home/.chezmoi.toml.tmpl](home/.chezmoi.toml.tmpl)).

### Common commands

```bash
# Preview changes
chezmoi diff

# Apply changes
chezmoi apply

# Pull latest + re-apply
chezmoi update
```

> [!TIP]
> Prefer `chezmoi diff` before `chezmoi apply` when you changed templates or secret values.

## What's included

### Shells

- Bash: [home/dot_bashrc](home/dot_bashrc)
- Zsh: [home/dot_zshrc.tmpl](home/dot_zshrc.tmpl)
- XDG-style Zsh entrypoints: [home/dot_config/zsh](home/dot_config/zsh) (these map to `~/.config/zsh/` via chezmoi's `dot_` attribute, and simply source the main `~/.zshenv` and `~/.zshrc` when you use `ZDOTDIR`)

### Git

- Global config template: [home/dot_config/git/config.tmpl](home/dot_config/git/config.tmpl)
- Global ignore: [home/dot_config/git/ignore_global](home/dot_config/git/ignore_global)
- Allowed signers (SSH signing): [home/dot_config/git/allowed_signers.tmpl](home/dot_config/git/allowed_signers.tmpl)

### Prompt

- Starship config: [home/dot_config/starship/starship.toml.tmpl](home/dot_config/starship/starship.toml.tmpl)

### Aliases

Aliases are defined in TOML and rendered into a shell script:

- Source of truth: [home/.chezmoidata/aliases.toml](home/.chezmoidata/aliases.toml)
- Rendered aliases script: [home/dot_config/shell/aliases.sh.tmpl](home/dot_config/shell/aliases.sh.tmpl)
- Cross-shell alias loader: [home/bin/aliases/load-aliases.sh.tmpl](home/bin/aliases/load-aliases.sh.tmpl)

### Packages (macOS)

Package lists are centralized in:

- [home/.chezmoidata/packages.toml](home/.chezmoidata/packages.toml)

This includes Homebrew formulae/casks and Mac App Store apps (via `mas`), with lists split by machine type (common/personal/work/dev/docker).

### macOS defaults

- Defaults script template: [home/bin/platform/darwin/executable_osx-defaults.sh.tmpl](home/bin/platform/darwin/executable_osx-defaults.sh.tmpl)

### App configs (macOS)

- iTerm2 assets (plist + profiles): [home/.assets/iterm2](home/.assets/iterm2)
- iTerm2 symlink template: [home/dot_config/applications/symlink_iterm2.tmpl](home/dot_config/applications/symlink_iterm2.tmpl)
- LinearMouse config: [home/dot_config/linearmouse/linearmouse.json.tmpl](home/dot_config/linearmouse/linearmouse.json.tmpl)

## Secrets (Bitwarden)

Templates can pull secrets from Bitwarden via chezmoi's Bitwarden integration.

- Bitwarden item IDs live in: [home/.chezmoidata/bitwarden.toml](home/.chezmoidata/bitwarden.toml)

### Login

```bash
bw login <your-email>

# If prompted when applying templates, unlock your vault:
bw unlock
```

## External repos

This repo can also fetch additional repositories via chezmoi externals, with the list coming from Bitwarden notes:

- Externals template: [home/.chezmoiexternal.toml.tmpl](home/.chezmoiexternal.toml.tmpl)

## Notes

- Templates under `home/` use standard chezmoi naming conventions (`dot_`, `private_`, `executable_`, `symlink_`).
- See the helper agent doc for deeper template patterns: [.github/agents/ChezMoi.agent.md](.github/agents/ChezMoi.agent.md)

Inspired by: [twpayne](https://github.com/twpayne/dotfiles) / [natelandau](https://github.com/natelandau/dotfiles) / [renemarc](https://github.com/renemarc/dotfiles)