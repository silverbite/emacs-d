;;------------------------------------------------------------------------------
;; Packages that help with remote systems
;;------------------------------------------------------------------------------

(require-package 'tramp)

(setq tramp-default-method "ssh")

;; use /sudo:ssh-host:remote-path
(add-to-list 'tramp-default-proxies-alist
	     '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
	     '((regexp-quote (system-name)) nil nil))
(add-to-list 'tramp-default-proxies-alist
	     '("localhost" nil nil))

(provide 'init-remote)
