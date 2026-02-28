cat <<EOF | sudo tee "/etc/udev/rules.d/99-hdmi-hotplug.rules"
ACTION=="change", SUBSYSTEM=="drm", ENV{HOTPLUG}=="1", \
RUN+="/bin/sh -c 'if [ ! -e /tmp/hdmi.lock ]; then \
touch /tmp/hdmi.lock; \
(sleep 3; rm /tmp/hdmi.lock) & \
su - $USER -c \"$HOME/.local/share/hiarchy/bin/hiarchy-main-monitor-detect\" & \
fi'"
EOF

echo "Reloading udev rules..."
sudo udevadm control --reload-rules
sudo udevadm trigger --subsystem-match=drm
