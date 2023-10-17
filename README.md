# FSLEF dotfiles

FSLEF dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Configure a new machine by following these steps:

#### Install Homebrew and minmimum packages:

Rename Computer Host Name

Install Homebrew
``` shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install packages
``` shell
brew install bitwarden-cli
brew install --cask bitwarden --no-quarantine
brew install chezmoi
```

#### Manualy install bws
https://github.com/bitwarden/sdk/releases

#### Login to bw
``` shell
bw login
```

#### Initialize Chezmoi config
```
chezmoi init fslef
```
