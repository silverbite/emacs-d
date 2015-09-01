;;------------------------------------------------------------------------------
;; Perspective
;;------------------------------------------------------------------------------

(require-package 'perspective)
(require-package 'helm)

;; Enable helm
;; (helm-mode 1)

;; Helm can now resize according to the number of candidates
;; (helm-autoresize-mode 1)

;; Toggle the perspective mode
(persp-mode)

(require-package 'projectile)

;; (require-package 'helm-projectile)
(require-package 'persp-projectile)

;; Alien or native
;; (setq projectile-indexing-method 'native)

;; Caching, enabled by default
;; (setq projectile-enable-caching t)

;;------------------------------------------------------------------------------
;; Completion engine
;;------------------------------------------------------------------------------

;; By default it uses 'ido'
;; (setq projectile-completion-system 'default)
;; Grizzl
;; (require-package 'grizzl)
;; (setq projectile-completion-system 'grizzl)
;; Or default
;; (setq projectile-completion-system 'default)
;; Or helm
;; (setq projectile-completion-system 'helm)

;; Enable projectile
(projectile-global-mode)

;; Enable helm
;; (helm-projectile-on)

;; http://tuhdo.github.io/helm-projectile.html
;; Switch to a project and execute an action specified in projectile-switch-project-action variable.
;; This variable stores a command to be executed after a project is selected. The default is projectile-find-file.
;; My suggestion is to bind it to helm-projectile-find-file, as it provides the same thing as projectile-find-file but with more feature:
;; (setq projectile-switch-project-action 'helm-projectile-find-file)


(provide 'init-project-management)
