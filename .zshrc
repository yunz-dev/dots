# PATH
path+=~/.cargo/bin

# ALIAS
alias vi="nvim"
alias vim="nvim"
source ~/scripts/secrets/ssh.sh

# EXPORT
export EDITOR=nvim

# Fuzzy Finder ------------------------
# Keybinds
# '** + TAB' fzf for cli argument
# <C-gb> - find git branch
# <C-gh> - find git hash
# <C-gt> - find git tag
# <C-gr> - find git remotes
# <C-gs> - find git stash
# <C-gl> - find git reflogs
# <C-gw> - find git worktrees
# <C-ge> - find git for-each-ref
#


# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ** completion for files
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# ** completion for directories
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/scripts/fzf-git.sh
# -------------------------------------

# Bat (like cat) ---------------------------------
export BAT_THEME="Catppuccin Mocha"
alias cat="bat"
# -------------------------------------
#
# Eza (better cat) ------------------------
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
#------------------------------------------------------------

#thefuck -----
eval $(thefuck --alias)
eval $(thefuck --alias fk)
eval $(thefuck --alias oops)
eval $(thefuck --alias typo)
# -----------

# zoxide (cd but better) ----
# use space + TAB to sort between similar names
eval "$(zoxide init zsh)"

alias cd="z"
# ----------------------------
