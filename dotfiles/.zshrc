# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Disable instant prompt console-io warning
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# =================== #
# ===== PLUGINS ===== #
# =================== #

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    git
    ssh-agent
    command-not-found
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ==========================
# === User Configuration ===
# ==========================

# ========== ADD TO PATH ========== #

# Cargo's bin directory
export PATH="$PATH:$HOME/.cargo/bin/"
# Latex
export PATH="$PATH:/usr/local/texlive/2025/bin/x86_64-linux"
# Dart's bin directory.
export PATH="$PATH":"$HOME/.pub-cache/bin"
# ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# ========== OTHER SETTINGS ========== #

# FlameMaster
FLAMEMASTER_PATH="$HOME/data/dev/projects/work/flamemaster/Bin/bin/Source.zsh"
[[ -f "$FLAMEMASTER_PATH" ]] && source "$FLAMEMASTER_PATH"

# Set CHROME_EXECUTABLE env var
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# Set qt6ct as the Qt platform theme engine.
# This allows us to use qt6ct to theme Qt.
export QT_QPA_PLATFORMTHEME=qt6ct

# Set preferred light-weight editor
export EDITOR=nvim

# Set preferred full-fledged editor
export VISUAL=nvim

# Set language
export LANG=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ========== CUSTOM FUNCTIONS ========== #

# Wrapper function for yazi.
# Provides the ability to change the current working directory when exiting yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
