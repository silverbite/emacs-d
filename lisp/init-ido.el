;;------------------------------------------------------------------------------
;; Ido related
;;------------------------------------------------------------------------------

;; use ido for minibuffer completion
(require-package 'ido-ubiquitous)
(require-package 'ido-vertical-mode)
(require-package 'ido)
(require-package 'smex)

(ido-mode t)
(ido-ubiquitous-mode t)
(ido-vertical-mode t)

(smex-initialize)

(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)
(setq ido-default-buffer-method 'selected-window)

;; default key to switch buffer is C-x b, but that's not easy enough
;;
;; when you do that, to kill emacs either close its frame from the window
;; manager or do M-x kill-emacs.  Don't need a nice shortcut for a once a
;; week (or day) action.
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
;; (global-set-key (kbd "C-x C-c") 'ido-switch-buffer)        ; (kbd "C-x C-c") is used to kill emacs
(global-set-key (kbd "C-x B") 'ibuffer)

;; (setq
;;  ido-enable-flex-matching t
;;  ido-use-virtual-buffers t)

;; (global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-x") 'smex)

;; have vertical ido completion lists
(setq ido-decorations
      '("\n-> " "" "\n   " "\n   ..." "[" "]"
	" [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]"))

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

(provide 'init-ido)
