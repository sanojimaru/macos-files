# aliases
alias ls="ls -la"
alias sl="ls -la"
alias vi="vim"

# zsh configration

# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd

# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups

# 上書きリダイレクトの禁止
setopt no_clobber

# 余分な空白は詰める
setopt hist_reduce_blanks

# サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
setopt auto_resume

# コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
setopt path_dirs

# ^でcd ..する
function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup
bindkey '^' cdup

# URLをコピペしたときに自動でエスケープ
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# rmの確認不要
setopt RM_STAR_SILENT

# curlで?や&をエスケープ無しで使える
setopt nonomatch

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit
  compinit
fi

# homebrew
export PATH=/opt/homebrew/bin:$PATH
eval "$(brew shellenv)"

# pkg-config
export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c/lib/pkgconfig"

# icu
export LDFLAGS="-L/opt/homebrew/opt/icu4c@76/lib"
export CPPFLAGS="-I/opt/homebrew/opt/icu4c@76/include"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh


