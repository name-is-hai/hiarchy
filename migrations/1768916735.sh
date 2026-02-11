echo "Fix microphone gain and audio mixing on Asus ROG laptops"

source "$HIARCHY_PATH/install/config/hardware/fix-asus-rog-mic.sh"
source "$HIARCHY_PATH/install/config/hardware/fix-asus-rog-audio-mixer.sh"

if hiarchy-hw-asus-rog; then
  hiarchy-restart-pipewire
fi
