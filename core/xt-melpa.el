;;; xt-melpa.el --- package.el support
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:

(require 'package)

;;; Standard package repositories
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


;;; On-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;;; Fire up package.el
(setq package-enable-at-startup nil)

;; keep the installed packages in .emacs.d
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

(package-initialize)

;; update the package metadata is the local cache is missing
(unless package-archive-contents
  (package-refresh-contents))

(require-package 'fullframe)
(fullframe list-packages quit-window)

;;; Common Lisp
(require-package 'cl)
(require-package 'cl-lib)


(provide 'xt-melpa)

;;; xt-melpa.el ends here
