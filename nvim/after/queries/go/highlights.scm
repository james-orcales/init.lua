;; extends

;https://github.com/nvim-treesitter/nvim-treesitter/discussions/3729#discussioncomment-3990282
((identifier) @keyword.exception (#any-of? @keyword.exception "err" "errors" "Err" "e"))
((type_identifier) @keyword.exception (#any-of? @keyword.exception "error"))
("defer" @keyword.defer)

