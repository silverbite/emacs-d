;;------------------------------------------------------------------------------
;; Shell related packages
;;------------------------------------------------------------------------------

(require-package 'sh-script)

;;; recognize pretzo files as zsh scripts
(defvar xt-pretzo-files '("zlogin" "zlogin" "zlogout" "zpretzorc" "zprofile" "zshenv" "zshrc"))

(mapc (lambda (file)
        (add-to-list 'auto-mode-alist `(,(format "\\%s\\'" file) . sh-mode)))
      xt-pretzo-files)

(add-hook 'sh-mode-hook
          (lambda ()
            (if (and buffer-file-name
                     (member (file-name-nondirectory buffer-file-name) xt-pretzo-files))
                (sh-set-shell "zsh"))))

;;; Bash files
;; https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-sh.el

(add-to-list 'auto-mode-alist '("\\.bash_profile\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash_history\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bashrc.local\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bashrc\\'" . sh-mode))

;; xitkov's files
(add-to-list 'auto-mode-alist '("\\.exports\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.aliasess\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.functions\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.sources\\'" . sh-mode))


;;------------------------------------------------------------------------------
;; Packages that help with remote systems
;;------------------------------------------------------------------------------

(require 'tramp)

(setq tramp-default-method "ssh")

;; use /sudo:ssh-host:remote-path
(add-to-list 'tramp-default-proxies-alist
         '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
         '((regexp-quote (system-name)) nil nil))
(add-to-list 'tramp-default-proxies-alist
         '("localhost" nil nil))


(provide 'init-shell)
