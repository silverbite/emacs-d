;;; xt-env-vars.el --- Environment vars
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:

;;------------------------------------------------------------------------------
;; Set path
;;------------------------------------------------------------------------------
;; https://github.com/milkypostman/dotemacs/blob/master/init.el
;; https://github.com/purcell/emacs.d/blob/master/lisp/init-exec-path.el

(require-package 'exec-path-from-shell)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(provide 'xt-env-vars)

;;; xt-env-vars.el ends here
