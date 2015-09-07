;;------------------------------------------------------------------------------
;; Haml
;;------------------------------------------------------------------------------
;; https://github.com/purcell/emacs.d/blob/master/lisp/init-haml.el

(require-package 'haml-mode)

(after-load 'haml-mode
  (define-key haml-mode-map (kbd "C-o") 'open-line))


(provide 'init-haml)
