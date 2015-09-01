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
(package-require 'uniquify)

;; (setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'reverse)

(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")


;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(package-require 'recentf)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))

(recentf-mode 1)

(setq recentf-max-menu-items 40)


(provide 'init-buffers)
