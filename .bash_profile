if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# path
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Homebrew
[ -d '/home/linuxbrew/.linuxbrew/bin' ] && PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
[ -d "$HOME/.linuxbrew/bin" ] && PATH="$HOME/.linuxbrew/bin:$PATH"

# Rust
[ -d "$HOME/.cargo/bin" ] && PATH="$HOME/.cargo/bin:$PATH"

# Ruby
[ -d "$HOME/.rbenv/bin" ] && PATH="$HOME/.rbenv/bin:$PATH"
type rbenv &>/dev/null && eval "$(rbenv init -)"

# Node
[ -d "$HOME/.nodenv/bin" ] && PATH="$HOME/.nodenv/bin:$PATH"
type nodenv &>/dev/null && eval "$(nodenv init -)"

# Flutter
type ghq &>/dev/null && [ -d "$(ghq root)/github.com/flutter/flutter/bin" ] &&
  PATH="$(ghq root)/github.com/flutter/flutter/bin:$PATH"

# Android SDK
if [ -d "$HOME/Library/Android/sdk" ]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  PATH="$ANDROID_HOME/emulator:$PATH"
  PATH="$ANDROID_HOME/tools:$PATH"
  PATH="$ANDROID_HOME/tools/bin:$PATH"
  PATH="$ANDROID_HOME/platform-tools:$PATH"
fi

# Mac OS
# suppress the warning "The default interactive shell is now zsh."
export BASH_SILENCE_DEPRECATION_WARNING=1

# WSL
if type cmd.exe &>/dev/null; then # is WSL
  # X server
  export DISPLAY=127.0.0.1:0.0
fi
