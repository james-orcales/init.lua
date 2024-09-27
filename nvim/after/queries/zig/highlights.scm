;; extends

;https://github.com/nvim-treesitter/nvim-treesitter/discussions/3729#discussioncomment-3990282
(("try") @keyword.exception (#set! "priority" 200))
(("catch") @keyword.exception (#set! "priority" 200))
(("error") @keyword.exception (#set! "priority" 200))
(function_declaration ("!") @keyword.exception (#set! "priority" 200))
(error_type ("error") @keyword.exception (#set! "priority" 200))


(("true") @boolean (#set! "priority" 200))
(("false") @boolean (#set! "priority" 200))

(("defer") @keyword.defer (#set! "priority" 200))
(("errdefer") @keyword.defer (#set! "priority" 200))
