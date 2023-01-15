if status is-interactive
    # Commands to run in interactive sessions can go here
  fish_add_path /usr/local/bin
end

starship init fish | source
