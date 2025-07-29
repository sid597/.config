;; file: nvim/fnl/plugins/git.fnl

[{1 :lewis6991/gitsigns.nvim
  :event "BufReadPre"
  :config (fn []
            (let [gitsigns (require :gitsigns)]
              (gitsigns.setup
                {;; Visual markers for changed lines
                 :signs {:add    {:text "│"}
                         :change {:text "│"}
                         :delete {:text "_"}
                         :topdelete {:text "‾"}
                         :changedelete {:text "~"}}
                 
                 :signcolumn true  ; Ensure the sign column is always shown
                 :numhl      true  ; Also highlight the line number
                 })))}]
