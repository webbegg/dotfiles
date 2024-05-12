eval (/usr/local/bin/brew shellenv)

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings
set -Ux EDITOR nvim

starship init fish | source

