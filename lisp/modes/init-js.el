(require-package 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'\\|\\.jshintrc\\'" . js-mode))

(setq js-indent-level 2)

;; http://writequit.org/org/settings.html#sec-1-3-12
(js2-imenu-extras-setup)
(setq-default js-auto-indent-flag nil
              js-indent-level 2)


(provide 'init-js)
