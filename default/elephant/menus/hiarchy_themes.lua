-- Dynamic Hiarchy Theme Menu for Elephant/Walker
Name = "hiarchythemes"
NamePretty = "Hiarchy Themes"

-- Check if file exists using Lua (no subprocess)
local function file_exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
    return true
  end
  return false
end

-- Get first image file from directory using find (robust against non-images)
local function first_image_in_dir(dir)
  -- Uses find to explicitly look for image extensions only
  local cmd = "find -L '" .. dir .. "' -maxdepth 1 -type f \\( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \\) 2>/dev/null | head -n 1"
  local handle = io.popen(cmd)
  if handle then
    local file = handle:read("*l")
    handle:close()
    if file and file ~= "" then
      return file -- find returns the full path, no need to concatenate dir
    end
  end
  return nil
end

-- The main function elephant will call
function GetEntries()
  local entries = {}
  local user_theme_dir = os.getenv("HOME") .. "/.config/hiarchy/themes"

  -- Fix: Prevent falling back to root "/themes"
  local hiarchy_path = os.getenv("HIARCHY_PATH")
  if not hiarchy_path or hiarchy_path == "" then
    hiarchy_path = "~/.local/share/hiarchy"
  end
  local default_theme_dir = hiarchy_path .. "/themes"

  local seen_themes = {}

  -- Helper function to process themes from a directory
  local function process_themes_from_dir(theme_dir)
    -- Single find call to get all theme directories
    local handle = io.popen("find -L '" .. theme_dir .. "' -mindepth 1 -maxdepth 1 -type d 2>/dev/null")
    if not handle then
      return
    end

    for theme_path in handle:lines() do
      local theme_name = theme_path:match(".*/(.+)$")

      if theme_name and not seen_themes[theme_name] then
        -- Check for preview images directly
        local preview_path = nil
        local preview_png = theme_path .. "/preview.png"
        local preview_jpg = theme_path .. "/preview.jpg"

        if file_exists(preview_png) then
          preview_path = preview_png
        elseif file_exists(preview_jpg) then
          preview_path = preview_jpg
        else
          -- Fallback: get first verified image from backgrounds
          preview_path = first_image_in_dir(theme_path .. "/backgrounds")
        end

        if preview_path and preview_path ~= "" then
          seen_themes[theme_name] = true

          local display_name = theme_name:gsub("_", " "):gsub("%-", " ")
          display_name = display_name:gsub("(%a)([%w_']*)", function(first, rest)
            return first:upper() .. rest:lower()
          end)
          display_name = display_name .. "  "

          table.insert(entries, {
            Text = display_name,
            Preview = preview_path,
            PreviewType = "file",
            Actions = {
              activate = "hiarchy-theme-set " .. theme_name,
            },
          })
        end
      end
    end

    handle:close()
  end

  -- Process user themes first (they take precedence)
  process_themes_from_dir(user_theme_dir)
  -- Then process default themes
  process_themes_from_dir(default_theme_dir)

  return entries
end

