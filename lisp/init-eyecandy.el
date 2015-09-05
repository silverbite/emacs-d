;;------------------------------------------------------------------------------
;; Eyecandy for Emacs
;;------------------------------------------------------------------------------

(tooltip-mode -1)
(mouse-wheel-mode t)
(blink-cursor-mode -1)

(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line
(global-hl-line-mode)			; highlight current line
;; (global-linum-mode 1)                   ; add line numbers on the left

(setq visible-bell t)
(setq font-lock-maximum-decoration t)
(setq color-theme-is-global t)
(setq truncate-partial-width-windows nil)

;;-----------------------------------------------------------------------------
;; Remove GUI elements
;;-----------------------------------------------------------------------------
;; https://github.com/milkypostman/dotemacs/blob/master/init.el
;; https://github.com/dimitri/emacs-kicker/blob/master/init.el

;; Turn off mouse interface early in startup to avoid momentary display

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq initial-scratch-message "")       ; don't use messages that you don't read
(setq inhibit-startup-screen t)         ; No splash screen please... jeez
(setq inhibit-splash-screen t)		; no splash screen, thanks
(setq visible-bell t)                   ; don't let Emacs hurt your ears

;; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))

;;------------------------------------------------------------------------------
;; Fonts, themes
;;------------------------------------------------------------------------------

;; choose your own fonts, in a system dependant way
(if (string-match "apple-darwin" system-configuration)
    (set-face-font 'default "Monaco-11")
  (set-face-font 'default "Monospace-10"))


;;------------------------------------------------------------------------------
;; Unclutter the modeline
;;------------------------------------------------------------------------------
;; https://github.com/magnars/.emacs.d/blob/master/settings/appearance.el

(require-package 'diminish)
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "tagedit" '(diminish 'tagedit-mode))
(eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
(eval-after-load "skewer-mode" '(diminish 'skewer-mode))
(eval-after-load "skewer-css" '(diminish 'skewer-css-mode))
(eval-after-load "skewer-html" '(diminish 'skewer-html-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "guide-key" '(diminish 'guide-key-mode))
(eval-after-load "whitespace-cleanup-mode" '(diminish 'whitespace-cleanup-mode))
(eval-after-load "subword" '(diminish 'subword-mode))

;;------------------------------------------------------------------------------
;; Sexy mode line
;;------------------------------------------------------------------------------

;; Powerline
;; (require-package 'powerline)
;; (powerline-default-theme)

;; Smart mode line
(require-package 'smart-mode-line)

(setq sml/no-confirm-load-theme t)

;; (setq sml/theme 'dark)
(setq sml/theme 'light)
;; (setq sml/theme 'respectful)

(sml/setup)

;; (add-to-list 'sml/replacer-regexp-list '("^~/Dropbox/Projects/In-Development/" ":ProjDev:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^~/Documents/Work/" ":Work:") t)

;; Added in the right order, they even work sequentially:
;; (add-to-list 'sml/replacer-regexp-list '("^~/Dropbox/" ":DB:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^:DB:Documents" ":DDocs:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^~/Git-Projects/" ":Git:") t)
;; (add-to-list 'sml/replacer-regexp-list '("^:Git:\\(.*\\)/src/main/java/" ":G/\\1/SMJ:") t)


(provide 'init-eyecandy)
