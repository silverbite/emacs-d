;;------------------------------------------------------------------------------
;; Perspective
;;------------------------------------------------------------------------------

(require-package 'perspective)

;; Change some settings

;; Change prefix key (before activating WG)
(setq wg-prefix-key (kbd "C-c z"))

;; Change workgroups session file
(setq wg-session-file "~/.emacs.d/.emacs_workgroups")

;; What to do on Emacs exit / workgroups-mode exit?
(setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
(setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil

(workgroups-mode 1)        ; put this one at the bottom of .emacs


(provide 'init-workgroups)
