const checkElement = setInterval(() => {
  const targetDiv = document.querySelector(".monaco-workbench");
  const commandDialog = document.querySelector(".quick-input-widget");

  if (targetDiv && commandDialog) {
    // Avoid injecting multiple blur elements
    if (!document.getElementById("command-blur")) {
      const blurElement = document.createElement("div");
      blurElement.setAttribute("id", "command-blur");
      blurElement.style.position = "absolute";
      blurElement.style.width = "100%";
      blurElement.style.height = "100%";
      blurElement.style.top = "0";
      blurElement.style.left = "0";
      blurElement.style.background = "rgba(0, 0, 0, 0.15)";
      blurElement.style.backdropFilter = "blur(8px)";
      blurElement.style.zIndex = "-100000";
      blurElement.style.pointerEvents = "none";
      targetDiv.appendChild(blurElement);

      // Set initial visibility based on current state
      if (commandDialog.style.display !== "none") {
        blurElement.style.zIndex = "100000";
      }

      // Observe changes to the dialog's style
      const observer = new MutationObserver((mutations) => {
        for (const mutation of mutations) {
          if (
            mutation.type === "attributes" &&
            mutation.attributeName === "style"
          ) {
            if (commandDialog.style.display === "none") {
              blurElement.style.zIndex = "-100000";
            } else {
              blurElement.style.zIndex = "100000";
            }
          }
        }
      });

      observer.observe(commandDialog, { attributes: true });
    }

    clearInterval(checkElement);
  }
}, 500);
