;;; init.el --- Load all packages
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:

(when *is-a-mac*
  (require 'init-osx))

(require 'init-ido)
(require 'init-shell)
(require 'init-project)
;; (require 'init-sessions)
;; (require 'init-workgroups)
(require 'init-programming)
(require 'init-company)
(require 'init-tags)


(provide 'xt-packages)

;;; xt-packages.el ends here
