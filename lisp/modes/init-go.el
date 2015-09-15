(require-package 'go-mode)

(require 'go-mode-autoloads)

(add-hook 'before-save-hook 'gofmt-before-save)

;;
;;; http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))

(provide 'init-go)
