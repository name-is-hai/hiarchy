echo "Replace buggy native Zoom client with webapp"

if hiarchy-pkg-present zoom; then
  hiarchy-pkg-drop zoom
  hiarchy-webapp-install "Zoom" https://app.zoom.us/wc/home https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/zoom.png
fi
