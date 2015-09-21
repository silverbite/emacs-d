;;------------------------------------------------------------------------------
;; Markdown mode
;;------------------------------------------------------------------------------

(require-package 'markdown-mode)

(require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'init-markdown)
