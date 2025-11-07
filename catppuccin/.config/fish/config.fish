# Inicialização do Starship
starship init fish | source


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

fish_add_path /home/cristhian/.spicetify
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$HOME/.spicetify:$PATH"
