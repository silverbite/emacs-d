;;------------------------------------------------------------------------------
;; Windows
;;------------------------------------------------------------------------------

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


;;------------------------------------------------------------------------------
;; Others
;;------------------------------------------------------------------------------

;;;; remaps
(define-key key-translation-map (kbd "<C-tab>") (kbd "M-TAB"))
(define-key key-translation-map (kbd "C-x C-m") (kbd "M-x"))
(define-key key-translation-map (kbd "C-x C-d") (kbd "C-x d"))

(define-key 'help-command "a" 'apropos)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)


(provide 'xt-config)

