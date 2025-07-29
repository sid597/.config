Directory structure:
└── sid597-.config/
    ├── README.md
    ├── cheatsheet.txt
    ├── picom.conf
    ├── .Xresources
    ├── gtk-2.0/
    │   └── gtkfilechooser.ini
    ├── gtk-3.0/
    │   ├── bookmarks
    │   └── settings.ini
    ├── gtk-4.0/
    │   └── settings.ini
    ├── i3/
    │   └── config
    ├── kitty/
    │   ├── theme.conf
    │   └── kitty-themes/
    │       └── themes/
    │           ├── 3024_Day.conf
    │           └── 3024_Night.conf
    ├── nvim/
    │   ├── init.lua
    │   ├── lazy-lock.json
    │   ├── .nfnl.fnl
    │   ├── fnl/
    │   │   ├── config/
    │   │   │   ├── init.fnl
    │   │   │   └── lsp.fnl
    │   │   └── plugins/
    │   │       ├── cmp.fnl
    │   │       ├── conjure.fnl
    │   │       ├── lsp.fnl
    │   │       ├── lualine.fnl
    │   │       ├── paredit.fnl
    │   │       ├── plugins.fnl
    │   │       ├── telescope.fnl
    │   │       ├── theme.fnl
    │   │       ├── treesitter.fnl
    │   │       └── undotree.fnl
    │   └── lua/
    │       ├── plugins.lua
    │       ├── config/
    │       │   ├── init.lua
    │       │   └── lsp.lua
    │       └── plugins/
    │           ├── cmp.lua
    │           ├── conjure.lua
    │           ├── lsp.lua
    │           ├── lualine.lua
    │           ├── paredit.lua
    │           ├── plugins.lua
    │           ├── telescope.lua
    │           ├── theme.lua
    │           ├── treesitter.lua
    │           └── undotree.lua
    └── polybar/
        ├── config.ini
        └── launch.sh


Files Content:

================================================
FILE: README.md
================================================
# Neovim + Clojure Workflow Cheatsheet (Colemak Remapped / Space Leader)

**Key:**
*   `<Space>` = Press Spacebar
*   `(N)` = Normal Mode
*   `(V)` = Visual Mode
*   `(I)` = Insert Mode
*   **Colemak Remaps (N/V):** `n`=left, `e`=down, `i`=up, `o`=right

---

## Setup / REPL Connection (Conjure) `(N)`

| Action                    | Binding     | Notes                                  |
| :------------------------ | :---------- | :------------------------------------- |
| Start REPL                | (External)  | Use `lein repl`, `clj`, etc. OUTSIDE Nvim |
| Connect to running REPL   | `<Space>lc` | Auto-detects `.nrepl-port` if possible |
| Disconnect from REPL      | `<Space>ld` |                                        |
| View/Focus REPL Log Buffer| `<Space>lv` | Shows results/errors in a split        |
| Clear REPL Log Buffer     | `<Space>ll` |                                        |
| List Active Sessions      | `<Space>ls` |                                        |
| Interrupt Evaluation      | `<Space>ei` | (Same as Eval Input)                   |
| Refresh Changed Namespaces| `<Space>rr` | Requires `tools.namespace`             |

---

## Editing & Structural Editing

| Action                      | Binding         | Mode | Notes                                     |
| :-------------------------- | :-------------- | :--- | :---------------------------------------- |
| Add surrounding pair        | `ysiw<char>`    | (N)  | Surround word (e.g., `ysiw)`)             |
| Change surrounding pair     | `cs<old><new>`  | (N)  | Change (e.g., `cs)]` changes `()` to `[]`)|
| Delete surrounding pair     | `ds<char>`      | (N)  | Delete (e.g., `ds"` deletes quotes)        |
| Auto-close `()`, `[]`, `{}` | (Auto)          | (I)  | Provided by nvim-autopairs                |
| Comment line/selection    | `gcc`/`gc`      | (N/V)| Requires commenting plugin (not listed)   |

*Note: `nvim-paredit` is installed but requires explicit keybindings for advanced functions (slurp/barf etc.).*

---

## Movement & Scrolling (Colemak Remapped) `(N)`

| Action                   | Binding      | Notes                             |
| :----------------------- | :----------- | :-------------------------------- |
| Cursor Left              | `n`          |                                   |
| Cursor Down              | `e`          |                                   |
| Cursor Up                | `i`          |                                   |
| Cursor Right             | `o`          |                                   |
| Scroll Down Half Page    | `<C-d>`      | Centers cursor after scroll       |
| Scroll Up Half Page      | `<C-u>`      | Centers cursor after scroll       |
| Go to Top of File        | `gg`         |                                   |
| Go to Bottom of File     | `G`          |                                   |
| Go Back (Jump List)      | `<leader>fb` | (Uses LSP mapping for convenience)|
| Go Forward (Jump List)   | `<C-i>`      | (Standard Vim)                    |

---

## Code Evaluation (Conjure) `(N)`

| Action                      | Binding     | Notes                             |
| :-------------------------- | :---------- | :-------------------------------- |
| Eval Current Form           | `<Space>ee` | Form cursor is in/on              |
| Eval Root Form              | `<Space>er` | Top-level form cursor is in       |
| Eval Entire Buffer          | `<Space>eb` |                                   |
| Eval Input (Prompt)         | `<Space>ei` | Type code into prompt to eval     |
| Eval & Replace Current Form | `<Space>ev` | Replaces code with result inline  |
| Eval Form into Comment      | `<Space>ec` | Adds result as comment below form |
| Eval Form & Tap Result      | `<Space>et` | Sends result to Tap>/Portal       |
| Tap Value Under Cursor      | `<Space>tv` | Sends value under cursor to Tap>/Portal |

---

## Code Intelligence & LSP (clojure-lsp) `(N)`

| Action                      | Binding     | Notes                             |
| :-------------------------- | :---------- | :-------------------------------- |
| Go to Definition            | `fd`        | Jump to definition of symbol      |
| Go to Declaration           | `<Space>gd` |                                   |
| Go to Type Definition       | `<Space>ft` |                                   |
| Conjure Docs Under Cursor   | `K`         | (Conjure mapping takes precedence)|
| LSP Hover Documentation     | `<Space>fh` | LSP specific hover/signature help |
| Rename Symbol               | `<Space>fn` | Rename symbol across project      |
| Show Line Diagnostics       | `<Space>fe` | Show errors/warnings in float     |
| Set Diagnostics in Loc List | `<Space>fq` | Populate location list with issues|
| Format Buffer/Selection     | `<Space>gf` | (N/V) Format code via LSP         |
| Go to Next Diagnostic       | `<Space>fj` |                                   |
| Go to Previous Diagnostic   | `<Space>fk` |                                   |
| Show Code Actions           | `<Space>fa` | (N/V) Show refactors/fixes        |
| Find References             | `<Space>fr` | (Uses Telescope)                  |
| Find Implementations        | `<Space>fi` | (Uses Telescope)                  |
| List Workspace Diagnostics  | `<Space>fw` | (Uses Telescope)                  |

---

## Searching & Finding (Telescope) `(N)`

| Action                   | Binding     | Notes                             |
| :----------------------- | :---------- | :-------------------------------- |
| Find Files               | `<Space>ff` | Fuzzy find files in project       |
| Grep String (Prompt)     | `<Space>fs` | Search for string (you type it)   |
| Live Grep                | `<Space>fg` | Search for string as you type     |
| Find Help Tags           | `<Space>fh` | Search Neovim help documents      |
| Find Buffers             | (Not mapped)| Standard: `:Telescope buffers<CR>`|
| Normal Search Forward    | `/`         |                                   |
| Normal Search Backward   | `?`         |                                   |
| Repeat Search Forward    | `n`         | (Note: Colemak `k` is mapped to `n`)|
| Repeat Search Backward   | `N`         |                                   |

---

## Window & Buffer Management `(N)`

| Action                   | Binding     | Notes                                      |
| :----------------------- | :---------- | :----------------------------------------- |
| Split Window Horizontal  | `:sp`       |                                            |
| Split Window Vertical    | `:vs`       |                                            |
| Move to Window Left      | `<C-w> h`   | (Use actual 'h' key on your keyboard)      |
| Move to Window Down      | `<C-w> j`   | (Use actual 'j' key)                       |
| Move to Window Up        | `<C-w> k`   | (Use actual 'k' key)                       |
| Move to Window Right     | `<C-w> l`   | (Use actual 'l' key)                       |
| Close Window             | `<C-w> q`   | or `:q`                                    |
| Save and Close Window    | `:wq`       |                                            |
| Quit Neovim              | `:qa` / `:wqa`|                                            |

---

## Yank / Paste / Undo `(N/V)`

| Action                      | Binding     | Mode  | Notes                                        |
| :-------------------------- | :---------- | :---- | :------------------------------------------- |
| Yank Line/Selection         | `<Space>y`  | (N/V) | Yank to system clipboard (`+` register)      |
| Yank Line                   | `<Space>Y`  | (N)   | Yank whole line to system clipboard (`+`)    |
| Yank Entire Buffer          | `<Space>yy` | (N/V) | Yank whole file to system clipboard (`+`)    |
| Select Entire Buffer        | `<Space>gg` | (N/V) | (Alternative to `ggVG`)                      |
| Paste from System Clipboard | `p`/`P`     | (N)   | Uses unnamedplus register by default         |
| Toggle Undotree             | `<Space>u`  | (N)   | Visualize undo history                       |

---

## Completion (CMP) `(I - Insert Mode)`

| Action                   | Binding   | Notes                                  |
| :----------------------- | :-------- | :------------------------------------- |
| Trigger Completion       | `<C-Space>`| Manually trigger completion popup      |
| Select Next Item         | `<C-n>`   |                                        |
| Select Previous Item     | `<C-p>`   |                                        |
| Scroll Docs Down         | `<C-f>`   |                                        |
| Scroll Docs Up           | `<C-b>`   |                                        |
| Close Completion         | `<C-e>`   |                                        |
| Confirm Selection        | `<CR>`    | Accept selected completion             |
| Next Item / Snippet Jump | `<Tab>`   | Cycles completion or jumps in snippet  |
| Prev Item / Snippet Jump | `<S-Tab>` | Cycles completion or jumps back snippet|

---

## General / Misc `(N)`

| Action                   | Binding     | Notes                                  |
| :----------------------- | :---------- | :------------------------------------- |
| Enter Ex Command Mode    | `:`         |                                        |
| Enter Normal Command Mode| `<Space>nn` | Run normal mode commands from prompt   |
| Reload Neovim Config     | (Not mapped)| Standard: `:so %` or restart Nvim      |
| Toggle Undotree          | `<Space>u`  |                                        |

---

*Remember: Practice makes perfect! Adapt bindings if needed. Check `:help <plugin_name>` for more details.*



================================================
FILE: cheatsheet.txt
================================================
-----------------------------------------------------------------------------------------
       Neovim + Clojure Workflow Cheatsheet (Colemak Remapped / Space Leader)
-----------------------------------------------------------------------------------------
 Key: <Space> = Press Spacebar | N = Normal Mode | V = Visual Mode | I = Insert Mode
      Your Colemak movement remaps (N/V): n=left, e=down, i=up, o=right
-----------------------------------------------------------------------------------------

--- Setup / REPL Connection (Conjure) --- (N)

  Action                       Binding      Notes
  ---------------------------- ------------ ----------------------------------------
  Start REPL                   (External)   Use `lein repl`, `clj`, etc. OUTSIDE Nvim
  Connect to running REPL      `<Space>lc`  Auto-detects `.nrepl-port` if possible
  Disconnect from REPL         `<Space>ld`
  View/Focus REPL Log Buffer   `<Space>lv`  Shows results/errors in a split
  Clear REPL Log Buffer        `<Space>ll`
  List Active Sessions         `<Space>ls`
  Interrupt Evaluation         `<Space>ei`  (Same as Eval Input)
  Refresh Changed Namespaces   `<Space>rr`  Requires `tools.namespace`

--- Editing & Structural Editing ---

  Action                       Binding      Notes
  ---------------------------- ------------ -------------------------------------------
  Add surrounding pair         `ysiw<char>` (N) Surround word (e.g., `ysiw)` )
  Change surrounding pair      `cs<old><new>`(N) Change (e.g., `cs)]` changes () to [])
  Delete surrounding pair      `ds<char>`    (N) Delete (e.g., `ds"` deletes quotes)
  Auto-close (), [], {}        (Auto)       (I) Provided by nvim-autopairs
  Comment line/selection       `gcc`/`gc`   (N/V) Requires commenting plugin (not listed, but common)
                                            Alternatively use visual block + `I` + `;` + `Esc`

--- Movement & Scrolling (Colemak Remapped) --- (N)

  Action                       Binding      Notes
  ---------------------------- ------------ -------------------------------------------
  Cursor Left                  `n`
  Cursor Down                  `e`
  Cursor Up                    `i`
  Cursor Right                 `o`
  Scroll Down Half Page        `<C-d>`      Centers cursor after scroll
  Scroll Up Half Page          `<C-u>`      Centers cursor after scroll
  Go to Top of File            `gg`
  Go to Bottom of File         `G`
  Go Back (Jump List)          `<leader>fb` (Uses your LSP mapping for convenience)
  Go Forward (Jump List)       `<C-i>`      (Standard Vim)

--- Code Evaluation (Conjure) --- (N)

  Action                       Binding      Notes
  ---------------------------- ------------ -------------------------------------------
  Eval Current Form            `<Space>ee`  Form cursor is in/on
  Eval Root Form               `<Space>er`  Top-level form cursor is in
  Eval Entire Buffer           `<Space>eb`
  Eval Input (Prompt)          `<Space>ei`  Type code into prompt to eval
  Eval & Replace Current Form  `<Space>ev`  Replaces code with result inline
  Eval Form into Comment       `<Space>ec`  Adds result as comment below form
  Eval Form & Tap Result       `<Space>et`  Sends result to Tap>/Portal
  Tap Value Under Cursor       `<Space>tv`  Sends value under cursor to Tap>/Portal

--- Code Intelligence & LSP (clojure-lsp) --- (N)

  Action                       Binding      Notes
  ---------------------------- ------------ -------------------------------------------
  Go to Definition             `fd`         Jump to definition of symbol under cursor
  Go to Declaration            `<Space>gd`
  Go to Type Definition        `<Space>ft`
  Conjure Docs Under Cursor    `K`          (Conjure mapping takes precedence)
  LSP Hover Documentation      `<Space>fh`  (Use this for LSP specific hover/signature)
  Rename Symbol                `<Space>fn`  Rename symbol across project
  Show Line Diagnostics        `<Space>fe`  Show errors/warnings for line in float
  Set Diagnostics in Loc List  `<Space>fq`  Populate location list with issues
  Format Buffer/Selection      `<Space>gf`  (N/V) Format code via LSP
  Go to Next Diagnostic        `<Space>fj`
  Go to Previous Diagnostic    `<Space>fk`
  Show Code Actions            `<Space>fa`  (N/V) Show available refactors/fixes
  Find References              `<Space>fr`  (Uses Telescope)
  Find Implementations         `<Space>fi`  (Uses Telescope)
  List Workspace Diagnostics   `<Space>fw`  (Uses Telescope)

--- Searching & Finding (Telescope) --- (N)

  Action                       Binding      Notes
  ---------------------------- ------------ -------------------------------------------
  Find Files                   `<Space>ff`  Fuzzy find files in project
  Grep String (Prompt)         `<Space>fs`  Search for string in project (you type it)
  Live Grep                    `<Space>fg`  Search for string as you type
  Find Help Tags               `<Space>fh`  Search Neovim help documents
  Find Buffers                 (Not mapped) Standard: `:Telescope buffers<CR>`
  Normal Search Forward        `/`
  Normal Search Backward       `?`
  Repeat Search Forward        `n`          (Note: Colemak `k` is mapped to `n`)
  Repeat Search Backward       `N`

--- Window & Buffer Management --- (N)

  Action                       Binding      Notes
  ---------------------------- ------------ -------------------------------------------
  Split Window Horizontal      `:sp`
  Split Window Vertical        `:vs`
  Move to Window Left          `<C-w> h`    (Use actual 'h' key on your keyboard)
  Move to Window Down          `<C-w> j`    (Use actual 'j' key)
  Move to Window Up            `<C-w> k`    (Use actual 'k' key)
  Move to Window Right         `<C-w> l`    (Use actual 'l' key)
  Close Window                 `<C-w> q` or `:q`
  Save and Close Window        `:wq`
  Quit Neovim                  `:qa` / `:wqa`

--- Yank / Paste / Undo --- (N/V)

  Action                       Binding      Notes
  ---------------------------- ------------ -------------------------------------------
  Yank Line/Selection          `<Space>y`   (N/V) Yank to system clipboard (+)
  Yank Line                    `<Space>Y`   (N) Yank whole line to system clipboard (+)
  Yank Entire Buffer           `<Space>yy`  (N/V) Yank whole file to system clipboard (+)
                               `<Space>gg`  (N/V) Select entire buffer (alternative)
  Paste from System Clipboard  `p`/`P`      (N) Uses unnamedplus register by default
  Toggle Undotree              `<Space>u`   (N) Visualize undo history

--- Completion (CMP) --- (I - Insert Mode)

  Action                       Binding      Notes
  ---------------------------- ------------ -------------------------------------------
  Trigger Completion           `<C-Space>`  Manually trigger completion popup
  Select Next Item             `<C-n>`
  Select Previous Item         `<C-p>`
  Scroll Docs Down             `<C-f>`
  Scroll Docs Up               `<C-b>`
  Close Completion             `<C-e>`
  Confirm Selection            `<CR>`       Accept selected completion
  Next Item / Snippet Jump     `<Tab>`      Cycles completion or jumps in snippet
  Prev Item / Snippet Jump     `<S-Tab>`    Cycles completion or jumps back in snippet

--- General / Misc --- (N)

  Action                       Binding      Notes
  ---------------------------- ------------ -------------------------------------------
  Enter Ex Command Mode        `:`
  Enter Normal Command Mode    `<Space>nn`  Run normal mode commands from prompt
  Reload Neovim Config         (Not mapped) Standard: `:so %` or restart Nvim
  Toggle Undotree              `<Space>u`

-----------------------------------------------------------------------------------------
      Remember: Practice makes perfect! Adapt bindings if needed. :help <plugin>
-----------------------------------------------------------------------------------------



================================================
FILE: picom.conf
================================================
# picom.conf for i3wm
# This configuration applies a blur effect only to kitty terminal windows.

# Use the GLX backend for better performance with blur.
backend = "glx";
vsync = true;

# Global blur settings.
blur:
{
  method   = "gaussian";  # Choose the gaussian blur method.
  size     = 50;          # Blur kernel size.
  deviation = 5.0;        # Standard deviation for the gaussian.
};

# Window rules: enable blur only on kitty windows.
rules = (
  { match = "class_g = 'kitty'"; blur-background = true; }
);

# Optional: disable shadows and fading if not needed.
shadow = false;
fading = false;



================================================
FILE: .Xresources
================================================
Xft.dpi: 119
! Enable Xft antialiasing with subpixel rendering
Xft.antialias:    true
Xft.rgba:         rgb

! Enable full hinting
Xft.hinting:      true
Xft.hintstyle:    hintfull

! Set the default (interface) font to Ubuntu Sans Medium
Xft.font:         Ubuntu Sans Medium

! (Optional) Set a preferred font for document text.
! Note: This resource is not standard—many applications have their own configuration.
Xft.document.font: Sans

! Set the monospace font (for terminals, code, etc.) to Ubuntu Sans Mono
Xft.monospace:    Ubuntu Sans Mono



================================================
FILE: gtk-2.0/gtkfilechooser.ini
================================================
[Filechooser Settings]
LocationMode=path-bar
ShowHidden=false
ShowSizeColumn=true
GeometryX=829
GeometryY=462
GeometryWidth=1128
GeometryHeight=790
SortColumn=name
SortOrder=ascending
StartupMode=recent



================================================
FILE: gtk-3.0/bookmarks
================================================
file:///home/sid/Documents
file:///home/sid/Music
file:///home/sid/Pictures
file:///home/sid/Videos
file:///home/sid/Downloads



================================================
FILE: gtk-3.0/settings.ini
================================================
[Settings]
gtk-application-prefer-dark-theme=1
gtk-theme-name=Yaru
gtk-icon-theme-name=Yaru
gtk-font-name=Sans Bold 12
gtk-cursor-theme-name=DMZ-Black
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
gtk-xft-rgba=none



================================================
FILE: gtk-4.0/settings.ini
================================================
[Settings]
gtk-application-prefer-dark-theme=1
gtk-application-prefer-dark-theme=1
gtk-theme-name=Yaru
gtk-icon-theme-name=Yaru
gtk-font-name=Sans Bold 14
gtk-cursor-theme-name=DMZ-Black
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
gtk-xft-rgba=none



================================================
FILE: i3/config
================================================
# This file has been auto-generated by i3-config-wizard(1).
# It will not be overwritten, so edit it as you like.
#
# Should you change your keyboard layout some time, delete
# this file and re-run i3-config-wizard(1).
#

# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!

# apply font settings on start

# exec_always --no-startup-id gsettings set org.gnome.desktop.interface font-name "Ubuntu Sans Medium @wght=500"
# exec_always --no-startup-id gsettings set org.gnome.desktop.interface document-font-name "Sans 14"
# exec_always --no-startup-id gsettings set org.gnome.desktop.interface monospace-font-name "Ubuntu Sans Mono"
# exec_always --no-startup-id gsettings set org.gnome.desktop.interface text-scaling-factor 1.50

# apply other startup options

#exec_always --no-startup-id picom --config ~/.config/picom.conf
exec_always --no-startup-id xrdb -merge ~/.config/.Xresources
exec_always --no-startup-id /usr/lib/gnome-settings-daemon/gsd-xsettings
exec_always --no-startup-id /home/sid/.config/bluetooth-autoconnect.sh
exec_always --no-startup-id xrandr --output HDMI-A-0 --rotate right --left-of DisplayPort-2
exec_always --no-startup-id feh --bg-scale /home/sid/Downloads/wallpapers/1.jgp
# exec_always --no-startup-id $HOME/.config/polybar/launch.sh &

# disable title bars
for_window [class=".*"] border pixel 
# Setup gaps
gaps inner 3
gaps outer 0
smart_gaps on

# start dmenu (a program launcher)
bindsym $mod+Shift+d exec i3-dmenu-desktop --dmenu="dmenu -i -fn 'Noto Sans:size=8'"
bindsym $mod+d exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3 -font 'Noto Sans Mono 16'
bindsym $mod+g exec google-chrome --high-dpi-support=1 --force-device-scale-factor=1.19 --enable-features=Vulkan
bindsym $mod+c exec ~/Applications/cursor.AppImage --no-sandbox
bindsym $mod+s exec /opt/firefox-nightly/firefox

set $mod Mod1

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:Ubuntu Sans Mono 13 

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# Start XDG autostart .desktop files using dex. See also
# https://wiki.archlinux.org/index.php/XDG_Autostart
exec --no-startup-id dex --autostart --environment i3

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# move tiling windows via drag & drop by left-clicking into the title bar,
# or left-clicking anywhere into the window while holding the floating modifier.
# tiling_drag modifier|titlebar

# start a terminal
bindsym $mod+Return exec kitty

# kill focused window
bindsym $mod+Shift+q kill

# A more modern dmenu replacement is rofi:
# bindcode $mod+40 exec "rofi -modi drun,run -show drun"
# There also is i3-dmenu-desktop which only displays applications shipping a
# .desktop file. It is a wrapper around dmenu, so you need that installed.
# bindcode $mod+40 exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym $mod+n focus left
bindsym $mod+e focus down
bindsym $mod+i focus up
bindsym $mod+o focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+n move left
bindsym $mod+Shift+e move down
bindsym $mod+Shift+i move up
bindsym $mod+Shift+o move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right


# split in horizontal orientation
bindsym $mod+Shift+h split h

# split in vertical orientation
bindsym $mod+Shift+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+w layout tabbed
bindsym $mod+eg layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+x exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym n resize shrink width 10 px or 10 ppt
        bindsym e resize grow height 10 px or 10 ppt
        bindsym i resize shrink height 10 px or 10 ppt
        bindsym o resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
}



================================================
FILE: kitty/theme.conf
================================================
background #090200
foreground #a4a1a1
cursor #a4a1a1
selection_background #494542
color0 #090200
color8 #5b5754
color1 #da2c20
color9 #e8bacf
color2 #00a152
color10 #3a3332
color3 #fcec02
color11 #494542
color4 #00a0e4
color12 #7f7c7b
color5 #a06994
color13 #d6d4d3
color6 #b5e4f4
color14 #ccab53
color7 #a4a1a1
color15 #f7f7f7
selection_foreground #090200




================================================
FILE: kitty/kitty-themes/themes/3024_Day.conf
================================================
background            #f7f7f7
foreground            #494542
cursor                #494542
selection_background  #a4a1a1
color0                #090200
color8                #5b5754
color1                #da2c20
color9                #e8bacf
color2                #00a152
color10               #3a3332
color3                #fcec02
color11               #494542
color4                #00a0e4
color12               #7f7c7b
color5                #a06994
color13               #d6d4d3
color6                #b5e4f4
color14               #ccab53
color7                #a4a1a1
color15               #f7f7f7
selection_foreground #f7f7f7



================================================
FILE: kitty/kitty-themes/themes/3024_Night.conf
================================================
background #090200
foreground #a4a1a1
cursor #a4a1a1
selection_background #494542
color0 #090200
color8 #5b5754
color1 #da2c20
color9 #e8bacf
color2 #00a152
color10 #3a3332
color3 #fcec02
color11 #494542
color4 #00a0e4
color12 #7f7c7b
color5 #a06994
color13 #d6d4d3
color6 #b5e4f4
color14 #ccab53
color7 #a4a1a1
color15 #f7f7f7
selection_foreground #090200



================================================
FILE: nvim/init.lua
================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("nvim is bootstrapping.")
  local fn = vim.fn

  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)
vim.loader.enable()

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup("plugins")



================================================
FILE: nvim/lazy-lock.json
================================================
{
  "LuaSnip": { "branch": "master", "commit": "c9b9a22904c97d0eb69ccb9bab76037838326817" },
  "cmp-buffer": { "branch": "main", "commit": "3022dbc9166796b644a841a02de8dd1cc1d311fa" },
  "cmp-conjure": { "branch": "master", "commit": "8c9a88efedc0e5bf3165baa6af8a407afe29daf6" },
  "cmp-nvim-lsp": { "branch": "main", "commit": "99290b3ec1322070bcfb9e846450a46f6efa50f0" },
  "cmp-vsnip": { "branch": "main", "commit": "989a8a73c44e926199bfd05fa7a516d51f2d2752" },
  "cmp_luasnip": { "branch": "master", "commit": "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" },
  "conjure": { "branch": "master", "commit": "ccec0904cadebba50dc92b39629af0f3df3ee09d" },
  "fennel.vim": { "branch": "master", "commit": "30b9beabad2c4f09b9b284caf5cd5666b6b4dc89" },
  "gruvbox.nvim": { "branch": "main", "commit": "089b60e92aa0a1c6fa76ff527837cd35b6f5ac81" },
  "lazy.nvim": { "branch": "main", "commit": "7e6c863bc7563efbdd757a310d17ebc95166cef3" },
  "lualine.nvim": { "branch": "master", "commit": "f4f791f67e70d378a754d02da068231d2352e5bc" },
  "nfnl": { "branch": "main", "commit": "e77254a6b7781b8ba89001b8878cfa8991e5a23f" },
  "nvim-autopairs": { "branch": "master", "commit": "3d02855468f94bf435db41b661b58ec4f48a06b7" },
  "nvim-cmp": { "branch": "main", "commit": "12509903a5723a876abd65953109f926f4634c30" },
  "nvim-lspconfig": { "branch": "master", "commit": "31226f6736a8150e323b346e4748e3c9bdd6bef5" },
  "nvim-paredit": { "branch": "master", "commit": "a7b22f211cd96fc8a4bb2c40eff5eeb04ce332ea" },
  "nvim-paredit-fennel": { "branch": "master", "commit": "b8a20ec576fb9b13cce3a14cc2cfe10e4c816d3a" },
  "nvim-surround": { "branch": "main", "commit": "ae298105122c87bbe0a36b1ad20b06d417c0433e" },
  "nvim-treesitter": { "branch": "master", "commit": "80e6de9d24eec68d82d5f4e6feae94c9c753ebd6" },
  "plenary.nvim": { "branch": "master", "commit": "857c5ac632080dba10aae49dba902ce3abf91b35" },
  "popup.nvim": { "branch": "master", "commit": "b7404d35d5d3548a82149238289fa71f7f6de4ac" },
  "telescope-ui-select.nvim": { "branch": "master", "commit": "6e51d7da30bd139a6950adf2a47fda6df9fa06d2" },
  "telescope.nvim": { "branch": "master", "commit": "78857db9e8d819d3cc1a9a7bdc1d39d127a36495" },
  "undotree": { "branch": "master", "commit": "2556c6800b210b2096b55b66e74b4cc1d9ebbe4f" }
}



================================================
FILE: nvim/.nfnl.fnl
================================================
{}



================================================
FILE: nvim/fnl/config/init.fnl
================================================
(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local map (fn [modes lhs rhs & [opts]]
  (vim.keymap.set modes lhs rhs (or opts {}))))



;space is reserved to be lead
(vim.keymap.set :n :<space> :<nop> {:noremap true})

;sets a nvim global options
(let [options
      {;tabs is space
       :expandtab      	true
       ;tab/indent size
       :tabstop        	2
       :shiftwidth     	2
       :softtabstop    	2
       :nu             	true 
;       :termguicolors   true
       :relativenumber 	true
       :wrap 		false 
       :swapfile 	false
       :backup 		false
       :undodir 	(.. (os.getenv "HOME") "/.vim/undodir")
       :undofile 	true
       :hlsearch        false
       :incsearch	true
       :scrolloff       8
       :updatetime      50
       ;settings needed for compe autocompletion
       :completeopt 	"menuone,noselect"
       ;case insensitive search
       :ignorecase 	true
       ;smart search case
       :smartcase 	true
       ;shared clipboard with linux
       :clipboard 	"unnamedplus"
       ;show line numbers
       :number 		true
       ;show line and column number
       :ruler 		true
       ;makes signcolumn always one column with signs and linenumber
       :signcolumn 	"number"}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))
(vim.opt.isfname:append "@-@")

(map "n" "<leader>nn" vim.cmd.Ex)
(local normal-visual-modes {"n" "v"})

; Window Splitting Keybindings
(map :n "<leader>v" "<cmd>vsplit<CR>" {:desc "Split window vertically"})
(map :n "<leader>h" "<cmd>split<CR>" {:desc "Split window horizontally"})

; Window Navigation Keybindings using Colemak keys
(map "n" "<leader>n" "<C-w>h") ; Leader + n (Colemak left) -> Move window left
(map "n" "<leader>e" "<C-w>j") ; Leader + e (Colemak down) -> Move window down
(map "n" "<leader>i" "<C-w>k") ; Leader + i (Colemak up)   -> Move window up
(map "n" "<leader>o" "<C-w>l") ; Leader + o (Colemak right)-> Move window right

(local key-mappings {
  "n" "h"
  "e" "j"
  "i" "k"
  "o" "l"
  "'" "o"
  "k" "n"
  "s" "i"
  "f" "e"
  "S" "I"})

(each [lhs rhs (pairs key-mappings)]
  (map "n" lhs rhs))

(each [lhs rhs (pairs key-mappings)]
  (map "v" lhs rhs))



; Create an autocmd group for custom Netrw mappings
(vim.api.nvim_create_augroup "CustomNetrwMappings" {:clear true})

(vim.api.nvim_create_autocmd "FileType"
  {:group "CustomNetrwMappings"
   :pattern "netrw"
   :callback (fn []
     (local netrw-mappings {
       "n" "h"
       "e" "j"
       "i" "k"
       "o" "l"
       "'" "o"
       "k" "n"
       "s" "i"
       "f" "e"
       "S" "I"})
     (each [lhs rhs (pairs netrw-mappings)]
       (vim.keymap.set "n" lhs rhs {:buffer true})))})




;Scrolling and Yank Keybindings
(vim.keymap.set "n" "<C-d>" "<C-d>zz")
(vim.keymap.set "n" "<C-u>" "<C-u>zz")
(vim.keymap.set "n" "<leader>y" "\"+y")
(vim.keymap.set "v" "<leader>y" "\"+y")
(vim.keymap.set "v" "<leader>Y" "\"+Y")
(vim.keymap.set "n" "<leader>gg" "ggVG")
(vim.keymap.set "v" "<leader>gg" "ggVG")



(vim.keymap.set ["n" "v"] "<leader>yy"
  (fn []
    (local old-pos (vim.fn.getpos "."))
    (vim.cmd "normal! ggVG\"+y")
    (vim.fn.setpos "." old-pos))
  {:desc "Yank entire buffer to system clipboard"})


{}




================================================
FILE: nvim/fnl/config/lsp.fnl
================================================
(var progress-message {:status "" :percent 0 :msg ""})

(fn get-progress-message []
  progress-message)

(fn progress-handler [_ msg info]
  (let [client (vim.lsp.get_client_by_id info.client_id)] 
    (when client 
      (set progress-message.status msg.value.kind)
      (when (not= msg.value.percentage nil)
        (set progress-message.percent msg.value.percentage))
      (if 
        (and (not= msg.value.message nil) 
             (and (not= msg.token nil)
                  (not= (type (tonumber msg.token)) "number")))
        (set progress-message.msg (.. msg.token " : " msg.value.message))

        (not= msg.value.message nil)
        (set progress-message.msg msg.value.message)

        (not= msg.token nil)
        (set progress-message.msg msg.token)))))

(fn setup-progress-handler []
  (let [original-handler (. vim.lsp.handlers :$/progress)]
    (tset vim.lsp.handlers :$/progress
          (fn [...]
            (let [args (vim.F.pack_len ...)]
              (progress-handler (vim.F.unpack_len args))
              (original-handler ...))))))

(setup-progress-handler)

{: get-progress-message}



================================================
FILE: nvim/fnl/plugins/cmp.fnl
================================================
(local cmp-src-menu-items
  {:buffer "buff"
   :conjure "conj"
   :nvim_lsp "lsp"
   :vsnip "vsnp"
   :luasnip "lsnp"})

(local cmp-srcs
  [{:name :nvim_lsp}
   {:name :conjure}
   {:name :buffer}
   {:name :vsnip}
   {:name :luasnip}])

(fn has-words-before []
  (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))]
    (and (not= col 0)
         (= (: (: (. (vim.api.nvim_buf_get_lines 0 (- line 1) line true) 1) :sub col col) :match "%s") nil))))

[{1 :hrsh7th/nvim-cmp
  :dependencies [:hrsh7th/cmp-buffer
                 :hrsh7th/cmp-nvim-lsp
                 :hrsh7th/cmp-vsnip
                 :PaterJason/cmp-conjure
                 :L3MON4D3/LuaSnip
                 :saadparwaiz1/cmp_luasnip]
  :config (fn []
            (let [cmp (require :cmp)
                  luasnip (require :luasnip)]
              (cmp.setup {:formatting {:format (fn [entry item]
                                                 (set item.menu (or (. cmp-src-menu-items entry.source.name) ""))
                                                 item)}
                          :mapping {:<C-p> (cmp.mapping.select_prev_item)
                                    :<C-n> (cmp.mapping.select_next_item)
                                    :<C-b> (cmp.mapping.scroll_docs (- 4))
                                    :<C-f> (cmp.mapping.scroll_docs 4)
                                    :<C-Space> (cmp.mapping.complete)
                                    :<C-e> (cmp.mapping.close)
                                    :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                                :select true})
                                    :<Tab> (cmp.mapping (fn [fallback]
                                                          (if
                                                            (cmp.visible) (cmp.select_next_item)
                                                            (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
                                                            (has-words-before) (cmp.complete)
                                                            :else (fallback)))
                                                        {1 :i 2 :s})
                                    :<S-Tab> (cmp.mapping (fn [fallback]
                                                            (if
                                                              (cmp.visible) (cmp.select_prev_item)
                                                              (luasnip.jumpable -1) (luasnip.jump -1)
                                                              :else (fallback)))
                                                          {1 :i 2 :s})}
                          :snippet {:expand (fn [args]
                                              (luasnip.lsp_expand args.body))}
                          :sources cmp-srcs})))}]



================================================
FILE: nvim/fnl/plugins/conjure.fnl
================================================
[{1 :Olical/conjure
  :branch "master"
  :init (fn []
          (set vim.g.conjure#mapping#doc_word "K")
          (set vim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false))}]



================================================
FILE: nvim/fnl/plugins/lsp.fnl
================================================
;symbols to show for lsp diagnostics
(fn define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
    (vim.fn.sign_define error {:text "" :texthl error})
    (vim.fn.sign_define warn  {:text "" :texthl warn})
    (vim.fn.sign_define info  {:text "" :texthl info})
    (vim.fn.sign_define hint  {:text "" :texthl hint})))

(define-signs "Diagnostic")

[{1 :neovim/nvim-lspconfig
  :config (fn []
            (let [lsp (require :lspconfig)
                  cmplsp (require :cmp_nvim_lsp)
                  handlers {"textDocument/publishDiagnostics"
                            (vim.lsp.with
                              vim.lsp.diagnostic.on_publish_diagnostics
                              {:severity_sort true
                               :update_in_insert true
                               :underline true
                               :virtual_text false})
                            "textDocument/hover"
                            (vim.lsp.with
                              vim.lsp.handlers.hover
                              {:border "single"})
                            "textDocument/signatureHelp"
                            (vim.lsp.with
                              vim.lsp.handlers.signature_help
                              {:border "single"})}
                  capabilities (cmplsp.default_capabilities)
                  before_init (fn [params]
                                (set params.workDoneToken :1))
                  on_attach (fn [client bufnr]
                              (do
                                (vim.api.nvim_buf_set_keymap bufnr :n :fd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fb "<C-O>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>gd "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>ft "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fn "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fe "<cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fq "<cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>gf "<cmd>lua vim.lsp.buf.format()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fj "<cmd>lua vim.diagnostic.goto_next()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fk "<cmd>lua vim.diagnostic.goto_prev()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fa "<cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :v :<leader>fa "<cmd>lua vim.lsp.buf.range_code_action()<CR> " {:noremap true})
                                ;telescope
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fw ":lua require('telescope.builtin').diagnostics()<cr>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
                                (vim.api.nvim_buf_set_keymap bufnr :n :<leader>fi ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})))]
              ;; To add support to more language servers check:
              ;; https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

              (lsp.ts_ls.setup {:on_attach on_attach
                     :handlers handlers
                     :before_init before_init
                     :capabilities capabilities})
              (lsp.clojure_lsp.setup {:on_attach on_attach
                        :handlers handlers
                        :before_init before_init
                        :capabilities capabilities
                        })


              ))}]



================================================
FILE: nvim/fnl/plugins/lualine.fnl
================================================
(local {: autoload} (require :nfnl.module))
(local lsp (autoload :config.lsp))

(fn lsp_connection []
  (let [message (lsp.get-progress-message)]
    (if
      ; if has progress handler and is loading
      (or (= message.status "begin")
          (= message.status "report"))
      (.. message.msg " : " message.percent "%% ")

      ; if has progress handler and finished loading
      (= message.status "end")
      ""

      ; if hasn't progress handler, but has connected lsp client
      (and (= message.status "")
           (not (vim.tbl_isempty (vim.lsp.buf_get_clients 0))))
      ""

      ; else
      "")))

[{1 :nvim-lualine/lualine.nvim
  :config (fn []
            (let [lualine (require :lualine)]
              (lualine.setup
                {:options {:theme "gruvbox"
                           :icons_enabled true
                           :section_separators ["" ""]
                           :component_separators ["" ""]}
                 :sections {:lualine_a []
                            :lualine_b [[:mode {:upper true}]]
                            :lualine_c [["FugitiveHead"]
                                        {1 :filename
                                         :file_status true
                                         :path 1
                                         :shorting_target 40}]
                            :lualine_x [{1 :diagnostics
                                         :sections [:error :warn :info :hint]
                                         :sources [:nvim_lsp]}
                                        [lsp_connection]
                                        :location
                                        :filetype]
                            :lualine_y [:encoding]
                            :lualine_z []}
                 :inactive_sections {:lualine_a []
                                     :lualine_b []
                                     :lualine_c [{1 :filename
                                                  :file_status true
                                                  :path 1}]
                                     :lualine_x []
                                     :lualine_y []
                                     :lualine_z []}})))}]



================================================
FILE: nvim/fnl/plugins/paredit.fnl
================================================
[{1 :julienvincent/nvim-paredit
  :lazy true
  :ft [:clojure :fennel]
  :config (fn []
            (let [paredit (require :nvim-paredit)]
              (paredit.setup)))}

 {1 :julienvincent/nvim-paredit-fennel
  :dependencies [:julienvincent/nvim-paredit]
  :lazy true
  :ft [:fennel]
  :config (fn []
            (let [paredit-fnl (require :nvim-paredit-fennel)]
              (paredit-fnl.setup)))}

 {1 :kylechui/nvim-surround
  :event "VeryLazy"
  :config (fn []
            (let [surround (require :nvim-surround)]
              (surround.setup)))}

 {1 :windwp/nvim-autopairs
  :event "InsertEnter"
  :opts {}}]



================================================
FILE: nvim/fnl/plugins/plugins.fnl
================================================
[{1 :bakpakin/fennel.vim
  :lazy true
  :ft [:fennel]}]



================================================
FILE: nvim/fnl/plugins/telescope.fnl
================================================
[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :init (fn []
          (vim.keymap.set :n :<leader>ff ":lua require('telescope.builtin').find_files()<CR>" {:noremap true})
          (vim.keymap.set :n :<leader>fs 
            (fn []
              (let [builtin (require :telescope.builtin)]
                (builtin.grep_string {:search (vim.fn.input "Grep > ")})))
            {:noremap true})
          (vim.keymap.set :n :<leader>fg ":lua require('telescope.builtin').live_grep()<CR>" {:noremap true})
          ;;(vim.keymap.set :n :<leader>fb ":lua require('telescope.builtin').buffers()<CR>" {:noremap true})
          (vim.keymap.set :n :<leader>fh ":lua require('telescope.builtin').help_tags()<CR>" {:noremap true}))
  :config (fn []
            (let [telescope (require :telescope)
                  themes (require :telescope.themes)]
              (telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]
                                           :vimgrep_arguments ["rg"
                                                               "--color=never"
                                                               "--no-heading"
                                                               "--with-filename"
                                                               "--line-number"
                                                               "--column"
                                                               "--smart-case"
                                                               "--iglob"
                                                               "!.git"
                                                               "--hidden"]}
                                :extensions {:ui-select {1 (themes.get_dropdown {})}}
                                :pickers {:find_files {:find_command ["rg"
                                                                      "--files"
                                                                      "--iglob"
                                                                      "!.git"
                                                                      "--hidden"]}}})
              (telescope.load_extension "ui-select")))}]



================================================
FILE: nvim/fnl/plugins/theme.fnl
================================================
(local current-theme :gruvbox)  ;; Change this to switch themes

;; gruvbox, , onedark, ,everforest, kangawa, nordic


;; Function to detect system theme on macOS
(fn get-system-mode []
  (let [output (vim.fn.system ["defaults" "read" "-g" "AppleInterfaceStyle"])]
    (if (string.match output "Dark")
        :dark
        :light)))

;; Set the mode based on system theme
;;(local mode (get-system-mode))

(if (= :dark :dark)
    (vim.api.nvim_set_option "background" "dark")
    (vim.api.nvim_set_option "background" "light"))


;; Define themes
[
  {1 :rose-pine/neovim
    :priority 1000
    :cond (= current-theme :rose)
    :config (fn []
              (let [rp (require :rose-pine)]
                (rp.setup {:disable-background true}))
              (vim.cmd "colorscheme rose-pine")
              ;;(vim.api.nvim_set_hl 0 "Normal" {:by none})
              ;;(vim.api.nvim_set_hl 0 "NormalFloat" {:by none})
              )}
  ;; Gruvbox Theme
  {1 :ellisonleao/gruvbox.nvim
    :priority 1000
    :cond (= current-theme :gruvbox)
    :config (fn []
              (let [gruvbox (require :gruvbox)]
                (gruvbox.setup
                  {:terminal_colors true
                   :undercurl true
                   :underline true
                   :bold false
                   :italic {:strings true
                            :emphasis true
                            :comments true
                            :operators false
                            :folds true}
                   :strikethrough true
                   :invert_selection false
                   :invert_signs false
                   :invert_tabline false
                   :invert_intend_guides false
                   :inverse true
                   :contrast "hard"
                   :palette_overrides {}
                   :overrides {}
                   :dim_inactive false
                   :transparent_mode true}))
              (vim.cmd "colorscheme gruvbox"))}


  ;; Onedark Theme (Light)
  {1 :navarasu/onedark.nvim
    :priority 1000
    :cond (= current-theme :onedark)
    :config (fn []
              (let [onedark (require :onedark)]
                (onedark.setup {:style (if (= mode :dark)
                                         :darker
                                         :light)}))
              (vim.cmd "colorscheme onedark"))}

  {1 :scottmckendry/cyberdream.nvim
    :priority 1000
    :cond (= current-theme :cyberdream)
    :config (fn []
              (let [cd (require :cyberdream)]
                (cd.setup {:transparent true}))
                
              (vim.cmd "colorscheme cyberdream"))}

  {1 :sainnhe/everforest
    :priority 1000
    :cond (= current-theme :everforest)
    :config (fn []
              (set vim.g.everforest_transparent_background 1)
              (vim.cmd "colorscheme everforest"))}

  {1 :rebelot/kanagawa.nvim
    :priority 1000
    :cond (= current-theme :kanagawa)
    :config (fn []
              (let [kan (require :kanagawa)]
                (kan.setup {:transparent false}))
              (vim.cmd "colorscheme kanagawa"))}

  ]




================================================
FILE: nvim/fnl/plugins/treesitter.fnl
================================================
[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config (fn []
            (let [treesitter (require :nvim-treesitter.configs)]
              (treesitter.setup {:highlight {:enable true}
                                 :indent {:enable true}
                                 :ensure_installed [:bash
                                                    :clojure
                                                    :commonlisp
                                                    :dockerfile
                                                    :fennel
                                                    :html
                                                    :java
                                                    :javascript
                                                    :json
                                                    :lua
                                                    :markdown
                                                    :yaml]})))}]



================================================
FILE: nvim/fnl/plugins/undotree.fnl
================================================
[{1 :mbbill/undotree
  :config (fn []
           (vim.keymap.set "n" "<leader>u" vim.cmd.UndotreeToggle))   }]




================================================
FILE: nvim/lua/plugins.lua
================================================
return {
  {
    "folke/lazy.nvim",
    version = "*"
  },
  {
    "Olical/nfnl",
    ft = "fennel",
    init = function()
      require("config")
    end,
  },
}



================================================
FILE: nvim/lua/config/init.lua
================================================
-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local map
local function _3_(modes, lhs, rhs, ...)
  local _arg_2_ = {...}
  local opts = _arg_2_[1]
  return vim.keymap.set(modes, lhs, rhs, (opts or {}))
end
map = _3_
vim.keymap.set("n", "<space>", "<nop>", {noremap = true})
do
  local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, nu = true, relativenumber = true, undodir = (os.getenv("HOME") .. "/.vim/undodir"), undofile = true, incsearch = true, scrolloff = 8, updatetime = 50, completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", number = true, ruler = true, signcolumn = "number", backup = false, hlsearch = false, swapfile = false, wrap = false}
  for option, value in pairs(options) do
    core.assoc(vim.o, option, value)
  end
end
vim.opt.isfname:append("@-@")
map("n", "<leader>nn", vim.cmd.Ex)
local normal_visual_modes = {n = "v"}
map("n", "<leader>v", "<cmd>vsplit<CR>", {desc = "Split window vertically"})
map("n", "<leader>h", "<cmd>split<CR>", {desc = "Split window horizontally"})
map("n", "<leader>n", "<C-w>h")
map("n", "<leader>e", "<C-w>j")
map("n", "<leader>i", "<C-w>k")
map("n", "<leader>o", "<C-w>l")
local key_mappings = {n = "h", e = "j", i = "k", o = "l", ["'"] = "o", k = "n", s = "i", f = "e", S = "I"}
for lhs, rhs in pairs(key_mappings) do
  map("n", lhs, rhs)
end
for lhs, rhs in pairs(key_mappings) do
  map("v", lhs, rhs)
end
vim.api.nvim_create_augroup("CustomNetrwMappings", {clear = true})
local function _4_()
  local netrw_mappings = {n = "h", e = "j", i = "k", o = "l", ["'"] = "o", k = "n", s = "i", f = "e", S = "I"}
  for lhs, rhs in pairs(netrw_mappings) do
    vim.keymap.set("n", lhs, rhs, {buffer = true})
  end
  return nil
end
vim.api.nvim_create_autocmd("FileType", {group = "CustomNetrwMappings", pattern = "netrw", callback = _4_})
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>gg", "ggVG")
vim.keymap.set("v", "<leader>gg", "ggVG")
local function _5_()
  local old_pos = vim.fn.getpos(".")
  vim.cmd("normal! ggVG\"+y")
  return vim.fn.setpos(".", old_pos)
end
vim.keymap.set({"n", "v"}, "<leader>yy", _5_, {desc = "Yank entire buffer to system clipboard"})
return {}



================================================
FILE: nvim/lua/config/lsp.lua
================================================
-- [nfnl] Compiled from fnl/config/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local progress_message = {status = "", percent = 0, msg = ""}
local function get_progress_message()
  return progress_message
end
local function progress_handler(_, msg, info)
  local client = vim.lsp.get_client_by_id(info.client_id)
  if client then
    progress_message.status = msg.value.kind
    if (msg.value.percentage ~= nil) then
      progress_message.percent = msg.value.percentage
    else
    end
    if ((msg.value.message ~= nil) and ((msg.token ~= nil) and (type(tonumber(msg.token)) ~= "number"))) then
      progress_message.msg = (msg.token .. " : " .. msg.value.message)
      return nil
    elseif (msg.value.message ~= nil) then
      progress_message.msg = msg.value.message
      return nil
    elseif (msg.token ~= nil) then
      progress_message.msg = msg.token
      return nil
    else
      return nil
    end
  else
    return nil
  end
end
local function setup_progress_handler()
  local original_handler = vim.lsp.handlers["$/progress"]
  local function _4_(...)
    local args = vim.F.pack_len(...)
    progress_handler(vim.F.unpack_len(args))
    return original_handler(...)
  end
  vim.lsp.handlers["$/progress"] = _4_
  return nil
end
setup_progress_handler()
return {["get-progress-message"] = get_progress_message}



================================================
FILE: nvim/lua/plugins/cmp.lua
================================================
-- [nfnl] Compiled from fnl/plugins/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local cmp_src_menu_items = {buffer = "buff", conjure = "conj", nvim_lsp = "lsp", vsnip = "vsnp", luasnip = "lsnp"}
local cmp_srcs = {{name = "nvim_lsp"}, {name = "conjure"}, {name = "buffer"}, {name = "vsnip"}, {name = "luasnip"}}
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return ((col ~= 0) and (vim.api.nvim_buf_get_lines(0, (line - 1), line, true)[1]:sub(col, col):match("%s") == nil))
end
local function _1_()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local function _2_(entry, item)
    item.menu = (cmp_src_menu_items[entry.source.name] or "")
    return item
  end
  local function _3_(fallback)
    if cmp.visible() then
      return cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      return luasnip.expand_or_jump()
    elseif has_words_before() then
      return cmp.complete()
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _5_(fallback)
    if cmp.visible() then
      return cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      return luasnip.jump(-1)
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _7_(args)
    return luasnip.lsp_expand(args.body)
  end
  return cmp.setup({formatting = {format = _2_}, mapping = {["<C-p>"] = cmp.mapping.select_prev_item(), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.close(), ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true}), ["<Tab>"] = cmp.mapping(_3_, {"i", "s"}), ["<S-Tab>"] = cmp.mapping(_5_, {"i", "s"})}, snippet = {expand = _7_}, sources = cmp_srcs})
end
return {{"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-vsnip", "PaterJason/cmp-conjure", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"}, config = _1_}}



================================================
FILE: nvim/lua/plugins/conjure.lua
================================================
-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g["conjure#mapping#doc_word"] = "K"
  vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
  return nil
end
return {{"Olical/conjure", branch = "master", init = _1_}}



================================================
FILE: nvim/lua/plugins/lsp.lua
================================================
-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local function define_signs(prefix)
  local error = (prefix .. "SignError")
  local warn = (prefix .. "SignWarn")
  local info = (prefix .. "SignInfo")
  local hint = (prefix .. "SignHint")
  vim.fn.sign_define(error, {text = "\239\129\151", texthl = error})
  vim.fn.sign_define(warn, {text = "\239\129\177", texthl = warn})
  vim.fn.sign_define(info, {text = "\239\129\154", texthl = info})
  return vim.fn.sign_define(hint, {text = "\239\129\153", texthl = hint})
end
define_signs("Diagnostic")
local function _1_()
  local lsp = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, update_in_insert = true, underline = true, virtual_text = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local capabilities = cmplsp.default_capabilities()
  local before_init
  local function _2_(params)
    params.workDoneToken = "1"
    return nil
  end
  before_init = _2_
  local on_attach
  local function _3_(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "fd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fb", "<C-O>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ft", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fe", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fq", "<cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gf", "<cmd>lua vim.lsp.buf.format()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fj", "<cmd>lua vim.diagnostic.goto_next()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fa", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>fa", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fw", ":lua require('telescope.builtin').diagnostics()<cr>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fr", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
    return vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fi", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
  end
  on_attach = _3_
  lsp.ts_ls.setup({on_attach = on_attach, handlers = handlers, before_init = before_init, capabilities = capabilities})
  return lsp.clojure_lsp.setup({on_attach = on_attach, handlers = handlers, before_init = before_init, capabilities = capabilities})
end
return {{"neovim/nvim-lspconfig", config = _1_}}



================================================
FILE: nvim/lua/plugins/lualine.lua
================================================
-- [nfnl] Compiled from fnl/plugins/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local lsp = autoload("config.lsp")
local function lsp_connection()
  local message = lsp["get-progress-message"]()
  if ((message.status == "begin") or (message.status == "report")) then
    return (message.msg .. " : " .. message.percent .. "%% \239\130\150")
  elseif (message.status == "end") then
    return "\239\131\136"
  elseif ((message.status == "") and not vim.tbl_isempty(vim.lsp.buf_get_clients(0))) then
    return "\239\131\136"
  else
    return "\239\130\150"
  end
end
local function _3_()
  local lualine = require("lualine")
  return lualine.setup({options = {theme = "gruvbox", icons_enabled = true, section_separators = {"", ""}, component_separators = {"\239\145\138", "\239\144\184"}}, sections = {lualine_a = {}, lualine_b = {{"mode", {upper = true}}}, lualine_c = {{"FugitiveHead"}, {"filename", file_status = true, path = 1, shorting_target = 40}}, lualine_x = {{"diagnostics", sections = {"error", "warn", "info", "hint"}, sources = {"nvim_lsp"}}, {lsp_connection}, "location", "filetype"}, lualine_y = {"encoding"}, lualine_z = {}}, inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {{"filename", file_status = true, path = 1}}, lualine_x = {}, lualine_y = {}, lualine_z = {}}})
end
return {{"nvim-lualine/lualine.nvim", config = _3_}}



================================================
FILE: nvim/lua/plugins/paredit.lua
================================================
-- [nfnl] Compiled from fnl/plugins/paredit.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local paredit = require("nvim-paredit")
  return paredit.setup()
end
local function _2_()
  local paredit_fnl = require("nvim-paredit-fennel")
  return paredit_fnl.setup()
end
local function _3_()
  local surround = require("nvim-surround")
  return surround.setup()
end
return {{"julienvincent/nvim-paredit", lazy = true, ft = {"clojure", "fennel"}, config = _1_}, {"julienvincent/nvim-paredit-fennel", dependencies = {"julienvincent/nvim-paredit"}, lazy = true, ft = {"fennel"}, config = _2_}, {"kylechui/nvim-surround", event = "VeryLazy", config = _3_}, {"windwp/nvim-autopairs", event = "InsertEnter", opts = {}}}



================================================
FILE: nvim/lua/plugins/plugins.lua
================================================
-- [nfnl] Compiled from fnl/plugins/plugins.fnl by https://github.com/Olical/nfnl, do not edit.
return {{"bakpakin/fennel.vim", lazy = true, ft = {"fennel"}}}



================================================
FILE: nvim/lua/plugins/telescope.lua
================================================
-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", {noremap = true})
  local function _2_()
    local builtin = require("telescope.builtin")
    return builtin.grep_string({search = vim.fn.input("Grep > ")})
  end
  vim.keymap.set("n", "<leader>fs", _2_, {noremap = true})
  vim.keymap.set("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true})
  return vim.keymap.set("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", {noremap = true})
end
local function _3_()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  telescope.setup({defaults = {file_ignore_patterns = {"node_modules"}, vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--hidden"}}, extensions = {["ui-select"] = {themes.get_dropdown({})}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}}})
  return telescope.load_extension("ui-select")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-telescope/telescope-ui-select.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}, init = _1_, config = _3_}}



================================================
FILE: nvim/lua/plugins/theme.lua
================================================
-- [nfnl] Compiled from fnl/plugins/theme.fnl by https://github.com/Olical/nfnl, do not edit.
local current_theme = "gruvbox"
local function get_system_mode()
  local output = vim.fn.system({"defaults", "read", "-g", "AppleInterfaceStyle"})
  if string.match(output, "Dark") then
    return "dark"
  else
    return "light"
  end
end
if ("dark" == "dark") then
  vim.api.nvim_set_option("background", "dark")
else
  vim.api.nvim_set_option("background", "light")
end
local function _3_()
  do
    local rp = require("rose-pine")
    rp.setup({["disable-background"] = true})
  end
  return vim.cmd("colorscheme rose-pine")
end
local function _4_()
  do
    local gruvbox = require("gruvbox")
    gruvbox.setup({terminal_colors = true, undercurl = true, underline = true, italic = {strings = true, emphasis = true, comments = true, folds = true, operators = false}, strikethrough = true, inverse = true, contrast = "hard", palette_overrides = {}, overrides = {}, transparent_mode = true, bold = false, dim_inactive = false, invert_intend_guides = false, invert_selection = false, invert_signs = false, invert_tabline = false})
  end
  return vim.cmd("colorscheme gruvbox")
end
local function _5_()
  do
    local onedark = require("onedark")
    local _6_
    if (mode == "dark") then
      _6_ = "darker"
    else
      _6_ = "light"
    end
    onedark.setup({style = _6_})
  end
  return vim.cmd("colorscheme onedark")
end
local function _8_()
  do
    local cd = require("cyberdream")
    cd.setup({transparent = true})
  end
  return vim.cmd("colorscheme cyberdream")
end
local function _9_()
  vim.g.everforest_transparent_background = 1
  return vim.cmd("colorscheme everforest")
end
local function _10_()
  do
    local kan = require("kanagawa")
    kan.setup({transparent = false})
  end
  return vim.cmd("colorscheme kanagawa")
end
return {{"rose-pine/neovim", priority = 1000, cond = (current_theme == "rose"), config = _3_}, {"ellisonleao/gruvbox.nvim", priority = 1000, cond = (current_theme == "gruvbox"), config = _4_}, {"navarasu/onedark.nvim", priority = 1000, cond = (current_theme == "onedark"), config = _5_}, {"scottmckendry/cyberdream.nvim", priority = 1000, cond = (current_theme == "cyberdream"), config = _8_}, {"sainnhe/everforest", priority = 1000, cond = (current_theme == "everforest"), config = _9_}, {"rebelot/kanagawa.nvim", priority = 1000, cond = (current_theme == "kanagawa"), config = _10_}}



================================================
FILE: nvim/lua/plugins/treesitter.lua
================================================
-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local treesitter = require("nvim-treesitter.configs")
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"bash", "clojure", "commonlisp", "dockerfile", "fennel", "html", "java", "javascript", "json", "lua", "markdown", "yaml"}})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_}}



================================================
FILE: nvim/lua/plugins/undotree.lua
================================================
-- [nfnl] Compiled from fnl/plugins/undotree.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end
return {{"mbbill/undotree", config = _1_}}



================================================
FILE: polybar/config.ini
================================================
[colors]
background = #282828
background-alt = #444
foreground = #dfdfdf
foreground-alt = #888
primary = #ffb52a
secondary = #e60053
alert = #bd2c40
bright_red = #fb4934
bright_orange = #fe8019
bright_yellow = #fabd2f
bright_blue = #83a598
bright_green = #98971a


[bar/main]
width = 100%
height = 2.5%
radius = 6.0
fixed-center = true
bottom = true

background = ${colors.background}
foreground = ${colors.foreground}

line-size = 2
padding = 2
module-margin = 1

font-0 = "Noto Sans Mono:size=13;1"
font-1 = "Noto Sans Mono:size=13;1"
font-2 = "Noto Sans Symbols:size=13;1"
font-3 = "Noto Sans Symbols2:size=13;1"

modules-left = date i3 
modules-center = xwindow
modules-right = memory cpu 

tray-position = right
tray-padding = 1
tray-maxsize = 24

wm-restack = i3

[global/wm]
margin-top = 0

[module/xwindow]
type = internal/xwindow
label = %title:0:50:...%

[module/i3]
type = internal/i3
pin-workspaces = false
enable-click = false
enable-scroll = true
strip-wsnumbers = true

;ws-icon-[0-9]+ = label;

format = <label-state> <label-mode>


label-mode-padding = 1
label-mode-foreground = #000


; unfocused = Inactive workspace on any monitor
label-unfocused = %name%
#label-unfocused-underline = #ffffff
label-unfocused-padding = 1

label-focused = " %name% "
label-focused-underline = ${colors.bright_yellow}
label-focused-padding = 1

label-occupied = " %name% "
label-occupied-foreground = #ffaa00

label-urgent = " %name% "
label-urgent-underline = #9b0a20

label-empty = " %name% "
label-empty-foreground = #555555

[module/cpu]
type = internal/cpu
interval = 2
format-prefix = "💻 "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = ${colors.bright_red}
label = %percentage:2%%

[module/memory]
type = internal/memory
interval = 2
format-prefix = "🗍 "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = ${colors.bright_orange}
label = %percentage_used:2%%

[module/wlan]
type = internal/network
interface = wlp2s0
interval = 5.0

format-connected = <ramp-signal> <label-connected>
format-connected-underline = #9f78e1
label-connected = %essid%

label-disconnected =

ramp-signal-0 = 🌧
ramp-signal-1 = 🌦
ramp-signal-2 = 🌥
ramp-signal-3 = 🌤
ramp-signal-4 = 🌣

[module/eth2]
type = internal/network
interface = enp12s0u1
interval = 3.0

format-connected-underline = #115511
format-connected-prefix = "🖧 "
format-connected-prefix-foreground = ${colors.foreground-alt}
label-connected = %local_ip%

format-disconnected =

[module/eth1]
type = internal/network
interface = enp0s31f6
interval = 3.0

format-connected-underline = #55aa55
format-connected-prefix = "🖧 "
format-connected-prefix-foreground = ${colors.foreground-alt}
label-connected = %local_ip%

format-disconnected =

[module/date]
type = internal/date
interval = 5

date = "%a %d"
date-alt = %a %b %d

time = %I:%M
time-alt = %I:%M%p

format-prefix =
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #0a6cf5

label = %date% %time%

[settings]
screenchange-reload = true

; vim:ft=dosini



================================================
FILE: polybar/launch.sh
================================================
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

exec polybar --reload main &


