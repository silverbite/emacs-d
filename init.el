;;; init.el --- Xitkov's configuration file

;;------------------------------------------------------------------------------
;; This file bootstraps the configuration
;;------------------------------------------------------------------------------

(let ((minver "23.3"))
  (when (version<= emacs-version "23.1")
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))


;;----------------------------------------------------------------------------
;; Bootstrap
;;----------------------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(require 'xt-utils)                     ;; Utilities
(require 'xt-melpa)                     ;; Machinery for installing required packages
(require 'xt-env-vars)                  ;; Set up $PATH and env
(require 'xt-sane-defaults)             ;; Sane defaults
(require 'xt-default-keybindings)       ;; Utilities


;;----------------------------------------------------------------------------
;; Load other modes and packages
;;----------------------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/modes" user-emacs-directory))

(require 'xt-packages)
(require 'xt-modes)


;;----------------------------------------------------------------------------
;; Load my Lisp stuff
;;----------------------------------------------------------------------------
;; (add-to-list 'load-path (expand-file-name "src" user-emacs-directory))
;; (require 'xt-src)


(provide 'init)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'downcase-region 'disabled nil)
