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

;; Remove trailing whitespace on saving
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; http://batsov.com/articles/2011/11/25/emacs-tip-number-3-whitespace-cleanup/
(add-hook 'before-save-hook 'whitespace-cleanup)

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

;; Use unix Line endings
(setq-default buffer-file-coding-system 'utf-8-unix)


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

;; Disable auto-save and auto-backup
;; http://emacsredux.com/blog/2013/05/09/keep-backup-and-auto-save-files-out-of-the-way/

;; (setq auto-save-default nil)
;; (setq make-backup-files nil)

;; store all backup and autosave files in the tmp dir
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))


;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
;; https://snarfed.org/gnu_emacs_backup_files

(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)


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

;; Delete selection
(delete-selection-mode t)

(set-default 'imenu-auto-rescan t)

;; Tramp
(require 'tramp)
;; Use ssh
(setq tramp-default-method "ssh")

;; anzu-mode enhances isearch & query-replace by showing total matches and current match position
(require-package 'anzu)
(global-anzu-mode)
(diminish 'anzu-mode)

(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; enable some really cool extensions like C-x C-j(dired-jump)
(require 'dired-x)

;; clean up obsolete buffers automatically
(require 'midnight)

;; smarter kill-ring navigation
(require-package 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
(global-set-key (kbd "s-y") 'browse-kill-ring)


;; (setq save-interprogram-paste-before-kill t)
;; (setq apropos-do-all t)
;; (setq mouse-yank-at-point t)
;; (setq visible-bell t)
;; (setq load-prefer-newer t)
;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; (setq save-place-file (concat user-emacs-directory "places"))
;; (setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))


;;----------------------------------------------------------------------------
;; Nicer naming of buffers for files with identical names
;;----------------------------------------------------------------------------

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.


;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds ‘<2>’, ‘<3>’, etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)

;; (setq uniquify-buffer-name-style 'forward)
;; (setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-buffer-name-style 'reverse)

(setq uniquify-separator " • ")
;; (setq uniquify-separator ":")

(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; @see http://www.emacswiki.org/emacs/SavePlace
(require-package 'saveplace)
(setq-default save-place t)

(setq save-place-file (concat user-emacs-directory ".saved-places"))
(setq save-place-forget-unreadable-files nil)

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(require-package 'recentf)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))

(recentf-mode 1)

(setq recentf-max-menu-items 40)


;;------------------------------------------------------------------------------
;; Locale environment and variables
;;------------------------------------------------------------------------------
;; http://www.emacswiki.org/emacs/EmacsCrashCode

;; (setq european-calendar-style 't)              ; European style calendar
;; (setq calendar-week-start-day 1)               ; Week starts monday
;; (setq ps-paper-type 'a4)                       ; Specify printing format
;; (setq ispell-dictionary "english")             ; Set ispell dictionary
;; (setq shell-file-name "/bin/bash")             ; Set Shell for M-| command
;; (setq tex-shell-file-name "/bin/bash")         ; Set Shell used by TeX
;; (setq grep-command "grep -i -nH -e ")          ; Set grep command options
;; (setq exec-path (append exec-path '("/bin")))  ; Change binary path


;; (setq auto-save-timeout 60)                    ; Autosave every minute
;; (desktop-save-mode t)                          ; Save session before quitting
;; (setq confirm-kill-emacs 'yes-or-no-p)         ; Confirm quit
;; (speedbar t)                                   ; Quick file access with bar
;; (setq make-backup-files nil)                   ; No backup files ~
;; (setq read-file-name-completion-ignore-case 't); Ignore case when completing file names


;; (setq-default indent-tabs-mode nil)            ; Use spaces instead of tabs
;; (setq tab-width 4)                             ; Length of tab is 4 SPC
;; (setq sentence-end-double-space nil)           ; Sentences end with one space
;; (setq truncate-partial-width-windows nil)      ; Don't truncate long lines
;; (setq-default indicate-empty-lines t)          ; Show empty lines
;; (setq next-line-add-newlines t)                ; Add newline when at buffer end
;; (setq require-final-newline 't)                ; Always newline at end of file
;; (global-linum-mode 1)                          ; Show line numbers on buffers
;; (show-paren-mode 1)                            ; Highlight parenthesis pairs
;; (setq blink-matching-paren-distance nil)       ; Blinking parenthesis
;; (setq show-paren-style 'expression)            ; Highlight text between parens


;; (setq pop-up-frame t)                          ; Buffers in separate frames
;; (setq frame-title-format "%b - emacs")         ; Use buffer name as frame title
;; (global-set-key "\C-x\C-b" 'buffer-menu)       ; CxCb puts point on buffer list
;; (setq window-min-height 10)                    ; Minimal height of windows
;; (setq enable-recursive-minibuffers t)          ; Stack  minibuffers
;; (icomplete-mode t)                             ; Completion in mini-buffer
;; (setq read-buffer-completion-ignore-case 't)   ; Ignore case when completing buffer names
;; (windmove-default-keybindings)                 ; Shift arrows switch windows
                                                  ; Note: This interferes with
                                                  ;  cua-mode where shift arrow starts
                                                  ;  marking. An alternative is
                                                  ;  (windmove-default-keybindings 'meta)
;; (setq-default case-fold-search t)              ; Search is case sensitive

;; (put 'narrow-to-region  'disabled nil)         ; Allow narrow-to-region command
;; (setq disabled-command-hook nil)               ; Allow all disabled commands
;; (setq undo-limit 100000)                       ; Increase number of undo
;; (defalias 'qrr 'query-replace-regexp)          ; Define an alias
;; (setq default-major-mode 'text-mode)           ; Text-mode is default mode
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)  ; auto-formatting in text-mode
;; (defalias 'yes-or-no-p 'y-or-n-p)              ; y/n instead of yes/no
;; (require 'cl)                                  ; Use Common Lisp features
                                                  ; Note: There are some problems
                                                  ;  with this. It might be better
                                                  ;  to just use it when compiling
                                                  ;  elisp files, see the elisp manual.


;; (tool-bar-mode nil)                            ; No toolbar
;; (mouse-wheel-mode t)                           ; Mouse-wheel enabled
;; (column-number-mode t)                         ; Show column number in mode-line
;; (global-hl-line-mode t)                        ; Highlight cursor line
;; (blink-cursor-mode 0)                          ; No blinking cursor
;; (icomplete-mode t)                             ; Completion in mini-buffer
;; (desktop-save-mode t)                          ; Save session before quitting
;; (speedbar t)                                   ; Quick file access with bar
;; (cua-mode t)                                   ; Cut/Paste with C-x/C-c/C-v


;;------------------------------------------------------------------------------
;; Eyecandy for Emacs
;;------------------------------------------------------------------------------

(tooltip-mode -1)
(blink-cursor-mode -1)
(setq track-eol nil)                           ; Cursor don't track end-of-line
(setq mouse-yank-at-point t)                   ; Paste at cursor position
(setq scroll-preserve-screen-position t)       ; Scroll without moving cursor
;; (set-cursor-color "black")                  ; Cursor color
(mouse-avoidance-mode 'jump)                   ; Mouse avoids cursor
(mouse-wheel-mode t)

(line-number-mode 1)                           ; have line numbers and
(column-number-mode t)                         ; column numbers in the mode line
(global-hl-line-mode t)                        ; highlight current line
;; (global-linum-mode 1)                       ; add line numbers on the left

(global-font-lock-mode 1)                      ; Color enabled
(setq font-lock-maximum-decoration t)
(setq color-theme-is-global t)
(setq truncate-partial-width-windows nil)

(define-key menu-bar-tools-menu [games] nil)   ; Remove games menu
;; (set-background-color "darkblue")           ; Background color
;; (set-face-background 'region "gray80")      ; Color for selected lines


;; Nyan cat for emacs!
(require-package 'nyan-mode)

;; (setq nyan-wavy-trail t)
;; (setq nyan-animate-nyancat t)

(nyan-mode t)


;;-----------------------------------------------------------------------------
;; Remove GUI elements
;;-----------------------------------------------------------------------------
;; https://github.com/milkypostman/dotemacs/blob/master/init.el
;; https://github.com/dimitri/emacs-kicker/blob/master/init.el

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

;; avoid compiz manager rendering bugs
;; (add-to-list 'default-frame-alist '(alpha . 100))
;; (add-to-list 'default-frame-alist '(font . "")); Change fonts

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


(provide 'xt-sane-defaults)
