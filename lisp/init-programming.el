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

;; Elisp
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)

;; No more :(
;; (global-rainbow-delimiters-mode)

;;; Rainbow mode
(require-package 'rainbow-mode)

;; Enable rainbow mode
(rainbow-mode)

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

;; Smart parens
;;;https://github.com/Fuco1/smartparens
(require-package 'smartparens)
(require 'smartparens-config)

;; Expand region
;;; https://github.com/atlefren/.emacs.d/blob/master/lisp/init-expand-region.el
(require-package 'expand-region)
(require 'expand-region)
;; keybinding
;; (global-set-key (kbd "C-c s") 'er/expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
;; (global-set-key (kbd "<M-up>") 'er/expand-region)
;; (global-set-key (kbd "<M-down>") 'er/contract-region)


;;------------------------------------------------------------------------------
;; Git related
;;------------------------------------------------------------------------------

;; http://zeekat.nl/articles/making-emacs-work-for-me.html
(require-package 'magit)
(require 'magit)

;; (setq magit-default-tracking-name-function #'magit-default-tracking-name-branch-only)
;; (setq magit-last-seen-setup-instructions "1.4.0")

;; Put signoff message on commits
(setq magit-commit-signoff t)

;; https://github.com/syohex/emacs-git-gutter
(require-package 'git-gutter)
(require 'git-gutter)

;; If you want to use git-gutter for files in git repository.
(global-git-gutter-mode +1)

;;------------------------------------------------------------------------------
;; Flycheck related
;;------------------------------------------------------------------------------
;; https://github.com/flycheck/flycheck
(require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;phpcs settings
;; (setq flycheck-php-phpcs-executable "/usr/local/bin/phpcs")
(setq flycheck-phpcs-standard (expand-file-name "~/.emacs.d/misc/lint/php/phpcs.xml"))

;;phpmd settings
;; (setq flycheck-php-phpmd-executable "/usr/local/bin/phpmd")
(setq flycheck-phpmd-rulesets '())
(add-to-list 'flycheck-phpmd-rulesets (expand-file-name "~/.emacs.d/misc/lint/php/phpmd.xml"))


;;------------------------------------------------------------------------------
;; Other
;;------------------------------------------------------------------------------

;;; highlight symbol
;; https://github.com/purcell/emacs.d/blob/41387d200fd496d9a96dd8dd0ee34e8b60e14555/lisp/init-editing-utils.el 
(require-package 'highlight-symbol)

(dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
  (add-hook hook 'highlight-symbol-mode)
  (add-hook hook 'highlight-symbol-nav-mode))


(provide 'init-programming)
