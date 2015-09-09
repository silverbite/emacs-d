;;------------------------------------------------------------------------------
;; Programming
;;------------------------------------------------------------------------------
;;

;;; show the name of the current function definition in the modeline
(require 'which-func)
(which-function-mode 1)

;;; Hippie expand
(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

;;; Rainbow delimiters
(require-package 'rainbow-delimiters)
(require 'rainbow-delimiters)

;; No more :(
;; (global-rainbow-delimiters-mode)

;;; Rainbow mode
(require-package 'rainbow-mode)


;;------------------------------------------------------------------------------
;; Multiple major modes
;;------------------------------------------------------------------------------

;;; Muti major modes
(require-package 'mmm-mode)
(require 'mmm-auto)

(setq mmm-global-mode 'buffers-with-submode-classes)
(setq mmm-submode-decoration-level 2)


;;; Neotree
(require-package 'neotree)
(global-set-key [f8] 'neotree-toggle)


(provide 'init-programming)
