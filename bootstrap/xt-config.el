;;------------------------------------------------------------------------------
;; Windows
;;------------------------------------------------------------------------------

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
;; (global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell, removes the audio bell as well as
;; the black box that appears when audio is disabled
;; https://github.com/flyingmachine/emacs-for-clojure/blob/master/customizations/ui.el
(setq ring-bell-function 'ignore)

;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

; winner-mode provides C-<left> to get back to previous window layout
(winner-mode 1)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; M-x shell is a nice shell interface to use, let's make it colorful.  If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; If you do use M-x term, you will notice there's line mode that acts like
;; emacs buffers, and there's the default char mode that will send your
;; input char-by-char, so that curses application see each of your key
;; strokes.
;;
;; The default way to toggle between them is C-c C-j and C-c C-k, let's
;; better use just one key to do the same.
(require 'term)
(define-key term-raw-map  (kbd "C-'") 'term-line-mode)
(define-key term-mode-map (kbd "C-'") 'term-char-mode)

;; Have C-y act as usual in term-mode, to avoid C-' C-y C-'
;; Well the real default would be C-c C-j C-y C-c C-k.
(define-key term-raw-map  (kbd "C-y") 'term-paste)


;; under mac, have Command as Meta and keep Option for localized input
;; (when (string-match "apple-darwin" system-configuration)
;;   (setq mac-allow-anti-aliasing t)
;;   (setq mac-command-modifier 'meta)
;;   (setq mac-option-modifier 'none))

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)

;; https://github.com/flyingmachine/emacs-for-clojure/blob/master/customizations/misc.el
;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;;------------------------------------------------------------------------------
;; Others
;;------------------------------------------------------------------------------

;; make indentation commands use space only (never tab character)
(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs

;; set default tab char's display width to 4 spaces
(setq default-tab-width 4)

;; set current buffer's tab char's display width to 4 spaces
(setq tab-width 4)

;; Column number mode
(setq column-number-mode t)

;; Show matching parenthesis
(show-paren-mode 1)

;; Window navigation using shift + <direction>
;; (windmove-default-keybindings)

;; Undo window kills
;; http://www.emacswiki.org/emacs/WinnerMode
;; (when (fboundp 'winner-mode)
;;   (winner-mode 1))

;;;; remaps
(define-key key-translation-map (kbd "<C-tab>") (kbd "M-TAB"))
(define-key key-translation-map (kbd "C-x C-m") (kbd "M-x"))
(define-key key-translation-map (kbd "C-x C-d") (kbd "C-x d"))

(define-key 'help-command "a" 'apropos)

;; Allow access from emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

;;------------------------------------------------------------------------------
;; Garbage collection tuning
;;------------------------------------------------------------------------------
;; https://github.com/lewang/flx

;; By default Emacs will initiate GC every 0.76 MB allocated (gc-cons-threshold == 800000). If we increase this to 20 MB (gc-cons-threshold == 20000000) we get:

;; (benchmark-run 1
;;   (setq gc-cons-threshold 20000000)
;;   (let ((cache (flx-make-filename-cache)))
;;     (dolist (i (number-sequence 0 10000))
;;       (flx-process-cache (uuid) cache))))
;;     ;;; ⇒ (0.62035 1 0.05461100000000041)

;; So if you have a modern machine, I encourage you to add the following:
(setq gc-cons-threshold 20000000)

;; Require final new line
(setq require-final-newline t)

;; (setq save-interprogram-paste-before-kill t)
;; (setq apropos-do-all t)
;; (setq mouse-yank-at-point t)
;; (setq visible-bell t)
;; (setq load-prefer-newer t)
;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; (setq save-place-file (concat user-emacs-directory "places"))
;; (setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))


(provide 'xt-config)
