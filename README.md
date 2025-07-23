## dotfiles

## Core Components

* **Shell**: [`zsh`](https://www.zsh.org/)
* **Prompt**: [`Powerlevel10k`](https://github.com/romkatv/powerlevel10k)
* **Plugin Manager**: [`Antidote`](https://antidote.sh/)
* **Symlink  Manager**: [`GNU Stow`](https://www.gnu.org/software/stow/)
* **Plugins**:
    * [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)
    * [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)


## WSL2 
### Fedora 42

#### 1. Prerequisites
```bash
sudo dnf install -y git
```

#### 2. Installation
```bash
git clone https://github.com/DN5S/dotfiles.git dotfiles 
cd dotfiles && ./install.sh
```
