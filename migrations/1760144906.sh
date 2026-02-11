echo "Change hiarchy-screenrecord to use gpu-screen-recorder"
hiarchy-pkg-drop wf-recorder wl-screenrec

# Add slurp in case it hadn't been picked up from an old migration
hiarchy-pkg-add slurp gpu-screen-recorder
