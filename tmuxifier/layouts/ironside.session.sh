# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "/Users/sawyer/F5/workspaces/sawyer-bigiq"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "ironside"; then

  # Create a new window inline within session layout definition.
  #new_window "misc"

  # Load a defined window layout.
  load_window "main"
  load_window "gulp"
  load_window "build"
  load_window "karma"

  # Select the default active window on session creation.
  select_window 0
  run_cmd "export P4CLIENT=sawyer-bigiq"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
