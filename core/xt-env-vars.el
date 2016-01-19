;;------------------------------------------------------------------------------
;; Set path
;;------------------------------------------------------------------------------
;; https://github.com/milkypostman/dotemacs/blob/master/init.el
;; https://github.com/purcell/emacs.d/blob/master/lisp/init-exec-path.el

(require-package 'exec-path-from-shell)

(after-load 'exec-path-from-shell
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var)))


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; (setq mp-extra-paths
;;       '("~/.cabal/bin/"
;;         "/usr/local/share/npm/bin/"
;;         "~/bin/"
;;         "/usr/local/bin/"
;;         "/usr/texbin/"))

;; (setenv "PATH"
;;         (mapconcat
;;          'identity
;;          (delete-dups
;;           (append
;;            (mapcar (lambda (path)
;;                      (if (string-match "^~" path)
;;                          (replace-match (getenv "HOME") nil nil path)
;;                        path)) mp-extra-paths)
;;            (split-string (getenv "PATH") ":")))
;;          ":"))

;; (mapc (lambda (path) (push path exec-path)) mp-extra-paths)


(provide 'xt-env-vars)
