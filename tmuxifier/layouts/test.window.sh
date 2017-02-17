# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/main"
window_root "$session_root/f5web/bigiq_ui/test/unitTests"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "karma"

# Split window into panes.
#split_v 20
#split_h 50

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1
run_cmd "alias karma=./node_modules/.bin/karma"
run_cmd "karma start karma.conf.js"

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
#select_pane 0
