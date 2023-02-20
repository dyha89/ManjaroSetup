#!/bin/bash

# Split panes horizontally and don't switch selection to the new pane to continue the script.
tmux split-window -hd -l 50% "vim && bash"

# vertical split with file manager
tmux split-window -vdb -p 50 "ranger && bash"
