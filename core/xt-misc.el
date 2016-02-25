;;; xt-misc.el --- Misc
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:

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


;; anzu-mode enhances isearch & query-replace by showing total matches and current match position
(require-package 'anzu)
(global-anzu-mode)


(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; enable some really cool extensions like C-x C-j(dired-jump)
(require 'dired-x)

;; clean up obsolete buffers automatically
(require 'midnight)


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

;; M-x shell is a nice shell interface to use, let's make it colorful.  If
;; you need a terminal emulator rather than just a shell, consider M-x term
;; instead.
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; smarter kill-ring navigation
(require-package 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
(global-set-key (kbd "s-y") 'browse-kill-ring)


;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(require-package 'recentf)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))

(setq recentf-max-saved-items 300
      recentf-exclude '("/auto-install/" ".recentf" "/repos/" "/elpa/"
                        "\\.mime-example" "\\.ido.last" "COMMIT_EDITMSG"
                        ".gz" "/anaconda-mode" "/auto-save-list" "/autosaves"
                        "~$" "/tmp/" "/ssh:" "/sudo:" "/scp:" "semanticdb"
                        "/backups" "/eshell" "/project-explorer-cache" )
      recentf-auto-cleanup 600)

(setq recentf-max-menu-items 40)

(recentf-mode 1)


;; @see http://www.emacswiki.org/emacs/SavePlace
(require-package 'saveplace)
(setq-default save-place t)


;;(setq save-place-file (expand-file-name ".places" user-emacs-directory)))
(setq save-place-file (concat user-emacs-directory ".saved-places"))
(setq save-place-forget-unreadable-files nil)



;; Nyan cat for emacs!
;; (require-package 'nyan-mode)
;; (setq nyan-wavy-trail t)
;; (setq nyan-animate-nyancat t)
;; (nyan-mode t)

;;------------------------------------------------------------------------------
;; God mode
;;------------------------------------------------------------------------------
;; https://github.com/chrisdone/god-mode

(require-package 'god-mode)

(global-set-key (kbd "<escape>") 'god-local-mode)

;; (global-set-key (kbd "<escape>") 'god-mode-all)
;; (setq god-exempt-major-modes nil)
;; (setq god-exempt-predicates nil)


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
(eval-after-load "subword" '(diminish 'subword-mode))
(eval-after-load "whitespace-cleanup-mode" '(diminish 'whitespace-cleanup-mode))
(eval-after-load "whitespace" '(diminish 'global-whitespace-mode))

;; Added by xitkov
(eval-after-load "ws-butler" '(diminish 'ws-butler-mode))
(eval-after-load "highlight-symbol" '(diminish 'highlight-symbol-mode))
(eval-after-load "git-gutter" '(diminish 'git-gutter-mode))
(eval-after-load "helm" '(diminish 'helm-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "anzu" '(diminish 'anzu-mode))

(provide 'xt-misc)

;;; xt-misc.el ends here
