;;; init-ido.el --- Ido and smex
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:

;;------------------------------------------------------------------------------
;; Ido related
;;------------------------------------------------------------------------------

;; use ido for minibuffer completion
(require-package 'ido)
(ido-mode t)

(require-package 'flx-ido)
(flx-ido-mode t)

(require-package 'ido-ubiquitous)
(ido-ubiquitous-mode t)

(require-package 'ido-vertical-mode)
(ido-vertical-mode t)

(ido-everywhere t)

(setq ido-enable-flex-matching t)

;; If you don't want to use the flx's highlights you can turn them off like this:
(setq flx-ido-use-faces nil)

(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)
(setq ido-default-buffer-method 'selected-window)

(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)

;; have vertical ido completion lists
(setq ido-decorations
      '("\n-> " "" "\n   " "\n   ..." "[" "]"
	" [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]"))


;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)


(require-package 'smex)

(setq smex-save-file "~/.emacs.d/.smex-items")
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(provide 'init-ido)

;;; init-ido.el ends here
