;;------------------------------------------------------------------------------
;; Shell related packages
;;------------------------------------------------------------------------------

(require-package 'sh-script)

;; recognize pretzo files as zsh scripts
(defvar xt-pretzo-files '("zlogin" "zlogin" "zlogout" "zpretzorc" "zprofile" "zshenv" "zshrc"))

(mapc (lambda (file)
        (add-to-list 'auto-mode-alist `(,(format "\\%s\\'" file) . sh-mode)))
      xt-pretzo-files)

(add-hook 'sh-mode-hook
          (lambda ()
            (if (and buffer-file-name
                     (member (file-name-nondirectory buffer-file-name) xt-pretzo-files))
                (sh-set-shell "zsh"))))

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
