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

(global-set-key (kbd "C-x C-b") 'ibuffer)
;; (global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
;; (global-set-key (kbd "C-x C-c") 'ido-switch-buffer)
;; (global-set-key (kbd "C-x B") 'ibuffer)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)


;; http://fgiasson.com/blog/index.php/2014/05/22/my-optimal-gnu-emacs-settings-for-developing-clojure-so-far/
;; (global-set-key [f8] 'other-frame)
;; (global-set-key [f7] 'paredit-mode)
;; (global-set-key [f9] 'cider-jack-in)
;; (global-set-key [f11] 'speedbar)


(provide 'xt-default-keybindings)
