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
