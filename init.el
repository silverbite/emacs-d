;;; init.el --- Xitkov's Emacs config
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:

;;------------------------------------------------------------------------------
;; This file bootstraps the configuration
;;------------------------------------------------------------------------------

(let ((minver "24"))
  (when (version<= emacs-version "24.1")
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24.4")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;; Required if installing via homebrew-emacs
;; https://github.com/Homebrew/homebrew-emacs
;;
;; (let ((default-directory "/usr/local/share/emacs/site-lisp/"))
;;  (normal-top-level-add-subdirs-to-load-path))


;;----------------------------------------------------------------------------
;; Core
;;----------------------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))

(require 'xt-melpa)                     ;; Machinery for installing required packages
(require 'xt-env-vars)                  ;; Set up $PATH and env
(require 'xt-sane-defaults)             ;; Sane defaults
(require 'xt-theme)                     ;; Theming
(require 'xt-misc)                      ;; Miscellaneous
(require 'xt-utils)                     ;; Utilities

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

;;; init.el ends here
(put 'downcase-region 'disabled nil)
