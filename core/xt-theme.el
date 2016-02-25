;;; xt-theme.el --- Theme
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:


(setq color-theme-is-global t)

;; choose your own fonts, in a system dependant way
(if (string-match "apple-darwin" system-configuration)
    ;;    (set-face-font 'default "Monaco-11")
    (set-face-font 'default "Source Code Pro-12")
  (set-face-font 'default "Monospace-10"))

(require-package 'noctilux-theme)
(require-package 'zenburn-theme)
(require-package 'solarized-theme)

(load-theme 'solarized-dark t)

;; (set-background-color "darkblue")           ; Background color
;; (set-face-background 'region "gray80")      ; Color for selected lines
;; (set-cursor-color "black")                  ; Cursor color


;; Powerline
;; (require-package 'powerline)
;; (powerline-default-theme)


;; Smart mode line
(require-package 'smart-mode-line)

(setq sml/no-confirm-load-theme t)

;; (setq sml/theme 'dark)
;; (setq sml/theme 'light)
(setq sml/theme 'respectful)

(sml/setup)

;; (add-to-list 'sml/replacer-regexp-list '("^~/Dropbox/Projects/In-Development/" ":ProjDev:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^~/Documents/Work/" ":Work:") t)

;; Added in the right order, they even work sequentially:
;; (add-to-list 'sml/replacer-regexp-list '("^~/Dropbox/" ":DB:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^:DB:Documents" ":DDocs:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^~/Git-Projects/" ":Git:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^:Git:\\(.*\\)/src/main/java/" ":G/\\1/SMJ:") t)


(provide 'xt-theme)

;;; xt-theme.el ends here
