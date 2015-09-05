;;------------------------------------------------------------------------------
;; Key bindings
;;------------------------------------------------------------------------------
;;

;; Start eshell
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Swap search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; (global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
;; (global-set-key (kbd "C-x C-c") 'ido-switch-buffer)        ; (kbd "C-x C-c") is used to kill emacs
(global-set-key (kbd "C-x B") 'ibuffer)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(provide 'xt-default-keybindings)
