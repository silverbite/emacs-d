;;; xt-misc.el --- Programming
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:


;; http://www.emacswiki.org/emacs/IndentingC
(setq c-default-style "linux"
      c-basic-offset 0)

;;; show the name of the current function definition in the modeline
(require 'which-func)
(which-function-mode 1)


;; https://github.com/bbatsov/emacs.d/blob/master/init.el
;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") #'hippie-expand)
(global-set-key (kbd "s-/") #'hippie-expand)


;;; Rainbow Delimiters
(require-package 'rainbow-identifiers)
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

;;; Rainbow delimiters
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;;; Rainbow mode
(require-package 'rainbow-mode)
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

(add-hook 'prog-mode-hook #'smartparens-mode)

;; Expand region
;;; https://github.com/atlefren/.emacs.d/blob/master/lisp/init-expand-region.el
(require-package 'expand-region)
(require 'expand-region)

(global-set-key (kbd "C-=") 'er/expand-region)


;;------------------------------------------------------------------------------
;; Git related
;;------------------------------------------------------------------------------

;; http://zeekat.nl/articles/making-emacs-work-for-me.html
(require-package 'magit)

;; (setq magit-default-tracking-name-function #'magit-default-tracking-name-branch-only)
;; (setq magit-last-seen-setup-instructions "1.4.0")

;; Put signoff message on commits
(setq magit-commit-signoff t)


;; https://github.com/syohex/emacs-git-gutter
(require-package 'git-gutter)
(global-git-gutter-mode +1)


;;------------------------------------------------------------------------------
;; Avy mode
;;------------------------------------------------------------------------------
;; https://github.com/abo-abo/avy

(require-package 'avy)

(avy-setup-default)

(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
;; (global-set-key (kbd "M-g g") 'avy-goto-line) ; Can replace M-g g
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)


;;------------------------------------------------------------------------------
;; Flycheck related
;;------------------------------------------------------------------------------
;; https://github.com/flycheck/flycheck
(require-package 'flycheck)
;; (add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'prog-mode-hook #'global-flycheck-mode)


;;phpcs settings
;; (setq flycheck-php-phpcs-executable "/usr/local/bin/phpcs")
;; (setq flycheck-phpcs-standard (expand-file-name "~/.emacs.d/misc/lint/php/phpcs.xml"))

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

;;; Whitespace butler
(require-package 'ws-butler)

(add-hook 'prog-mode-hook 'ws-butler-mode)


;; https://github.com/pashky/restclient.el
(require-package 'restclient)

;;-------------------------------------------------------------------------------
;; Yasnippet
;;------------------------------------------------------------------------------

(require-package 'yasnippet)

(yas-global-mode 1)


(provide 'init-programming)

;;; init-programming.el ends here
