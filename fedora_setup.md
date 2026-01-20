# Enable Repos
```
sudo dnf copr enable varlad/zellij
```

### PowerShell
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
curl https://packages.microsoft.com/config/fedora/42/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
sudo dnf makecache
```

# Packages
```
sudo dnf install -y \
    dnf-plugins-core \
    wget \
    openssl \
    kubectl \
    k9s \
    azure-cli \
    helm \
    zsh \
    git \
    nvim \
    p7zip \
    p7zip-plugins \
    btop \
    jq \
    nmap \
    zellij \
    zoxide \
    powershell
```

## Non-Repo

### GitHub Copilot
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/intall.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
npm install -g npm@11
npm install -g @github/copilot
```

### TalosCTL

`curl -sL https://talos.dev/install | sh`

### Packer and Terraform
```
wget -O- https://rpm.releases.hashicorp.com/fedora/hashicorp.repo | sudo tee /etc/yum.repos.d/hashicorp.repo
sudo yum list available | grep hashicorp
sudo dnf -y install packer terraform
```

### Docker
```
sudo dnf config-manager addrepo \
  --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
```
# Zsh Setup
## Set Default Shell
`chsh -s /bin/zsh`

## Cloud Plugins

### powerlevel10k
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k`

### zsh-vi-mode
`git clone https://github.com/jeffreytse/zsh-vi-mode.git ~/.zsh-vi-mode`

## Example zshrc
```
# Enable Powerlevel10k instant prompt — keep near top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Zsh completion
autoload -Uz compinit
compinit

# Source Powerlevel10k theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# If you have a ~/.p10k.zsh from a prior config, source it
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Load zsh-vi-mode plugin
source ~/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Load zoxide
eval "$(zoxide init zsh)"

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# Custom exports
export EDITOR=nvim
export KUBE_EDITOR=nvim

# Aliases
alias tf='terraform'
alias kub='kubectl'
alias vi='nvim'
alias vim='nvim'
alias nv='nvim'
alias cd='z'
```

# Git Config
`~/.gitconfig`
```
[url "ssh://git@github.com/"]
        insteadOf = http://github.com/
[url "git@github.com:"]
        insteadOf = https://github.com/
```

# SSH Config
`~/.ssh/config`
```
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes
  AddKeysToAgent yes

Host ssh.github.com
  HostName ssh.github.com
  User git
  Port 443
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes
```

# Azure Kubernetes Setup

## AZ AKS CLI
`sudo az aks install-cli`