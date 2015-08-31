#!/bin/zsh

# Create 3 new sessions
tmux new-session -d -s development
tmux new-session -d -s deployment
tmux new-session -d -s fun

# Attach to "development" session
tmux -2 attach-session -t development