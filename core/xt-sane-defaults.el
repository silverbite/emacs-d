;;; xt-sane-defaults.el --- Sane defaults
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:


;; Turn off mouse interface early in startup to avoid momentary display
(set-scroll-bar-mode 'right)                   ; Scrollbar on the right

(when (fboundp 'menu-bar-mode) (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq initial-scratch-message "")       ; don't use messages that you don't read
(setq inhibit-startup-screen t)         ; No splash screen please... jeez
(setq inhibit-startup-message t)        ; No message at startup
(setq inhibit-splash-screen t)          ; no splash screen, thanks
(setq visible-bell t)                   ; don't let Emacs hurt your ears


;; full path in title bar
;;(setq-default frame-title-format "%b (%f)")

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))


;; Disable auto-save and auto-backup
;; http://emacsredux.com/blog/2013/05/09/keep-backup-and-auto-save-files-out-of-the-way/
(setq auto-save-default nil)
(setq make-backup-files nil)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; make indentation commands use space only (never tab character)
(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq-default tab-width 4) ; set default tab char's display width to 4 spaces
(setq-default buffer-file-coding-system 'utf-8-unix) ; Use unix Line endings
(setq-default sh-basic-offset 4)
(setq-default sh-indentation 4)
(setq-default indicate-buffer-boundaries 'right)

(set-default 'imenu-auto-rescan t)
(set-default 'indicate-empty-lines t)


;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

(setq show-trailing-whitespace t)
(setq save-interprogram-paste-before-kill t)
(setq apropos-do-all t)
(setq mouse-yank-at-point t)
(setq visible-bell nil)
(setq load-prefer-newer t)
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)

;; (setq show-paren-style 'expression)            ; Highlight text between parens
;; (setq pop-up-frame t)                          ; Buffers in separate frames
;; (setq-default case-fold-search t)              ; Search is case sensitive

(setq tab-always-indent 'complete)             ; smart tab behavior - indent or complete
(setq tab-width 4)                             ; set current buffer's tab char's display width to 4 spaces
(setq create-lockfiles nil)                    ; No need for ~ files when editing
(setq blink-matching-paren-distance nil)       ; Blinking parenthesis
(setq next-line-add-newlines nil)                ; Add newline when at buffer end
(setq require-final-newline 't)                ; Always newline at end of file
(setq-default indicate-empty-lines nil)         ; Show empty lines
(setq truncate-partial-width-windows nil)      ; Don't truncate long lines
(setq read-file-name-completion-ignore-case 't); Ignore case when completing file names
(setq confirm-kill-emacs 'yes-or-no-p)         ; Confirm quit
(setq undo-limit 100000)                       ; Increase number of undo
(setq initial-major-mode 'org-mode)            ; Start with an empty scratch buffer in org mode
(setq large-file-warning-threshold 100000000)  ; warn when opening files bigger than 100MB


;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

(winner-mode 1) ; winner-mode provides C-<left> to get back to previous window layout

(global-auto-revert-mode 1) ; Revert buffer to reflect changes on disk

(fset 'yes-or-no-p 'y-or-n-p) ; Changes all yes/no questions to y/n type

;; (toggle-indicate-empty-lines)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(blink-cursor-mode -1)                         ; No blinking cursor
(tooltip-mode -1)                              ; No tooltip

(mouse-avoidance-mode 'jump)                   ; Mouse avoids cursor
(mouse-wheel-mode t)                           ; Mouse-wheel enabled

(delete-selection-mode t)                      ; Delete selection

(global-linum-mode -1)                         ; add line numbers on the left
(global-hl-line-mode t)                        ; Highlight cursor line
(global-font-lock-mode 1)                      ; Color enabled

(icomplete-mode t)                             ; Completion in mini-buffer
(show-paren-mode 1)                            ; Highlight parenthesis pairs

(setq track-eol t)                           ; Cursor don't track end-of-line
(setq mouse-yank-at-point t)                   ; Paste at cursor position
(setq scroll-preserve-screen-position t)       ; Scroll without moving cursor
(setq font-lock-maximum-decoration t)
(setq truncate-partial-width-windows nil)



;; Allow access from emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))



;; extend the help commands
;; (define-key 'help-command (kbd "C-f") #'find-function)
;; (define-key 'help-command (kbd "C-k") #'find-function-on-key)
;; (define-key 'help-command (kbd "C-v") #'find-variable)
;; (define-key 'help-command (kbd "C-l") #'find-library)

;; (define-key 'help-command (kbd "C-i") #'info-display-manual)

;; misc useful keybindings
;; (global-set-key (kbd "s-<") #'beginning-of-buffer)
;; (global-set-key (kbd "s->") #'end-of-buffer)
;; (global-set-key (kbd "s-q") #'fill-paragraph)

;; align code in a pretty way
(global-set-key (kbd "C-x \\") #'align-regexp)

;; Start eshell
(global-set-key (kbd "C-x m") #'eshell)
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Swap search
(global-set-key (kbd "C-s") #'isearch-forward-regexp)
(global-set-key (kbd "C-r") #'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") #'isearch-forward)
(global-set-key (kbd "C-M-r") #'isearch-backward)

(global-set-key (kbd "C-x C-b") #'ibuffer)
;; (global-set-key (kbd "C-x C-b") '#ido-switch-buffer)
;; (global-set-key (kbd "C-x C-c") '#ido-switch-buffer)
;; (global-set-key (kbd "C-x B") '#ibuffer)

(global-set-key (kbd "C-?") #'help-command)
(global-set-key (kbd "M-?") #'mark-paragraph)
(global-set-key (kbd "C-h") #'delete-backward-char)
(global-set-key (kbd "M-h") #'backward-kill-word)


(provide 'xt-sane-defaults)

;;; xt-sane-defaults.el ends here
