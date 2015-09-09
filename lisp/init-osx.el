(when *is-a-mac*
  ;; set keys for Apple keyboard, for emacs in OS X
  (setq mac-option-key-is-meta nil)
  (setq mac-command-key-is-meta t)

  (setq mac-command-modifier 'meta)      ; make cmd key do Meta
  (setq mac-option-modifier 'super)      ; make opt key do Super
  (setq mac-control-modifier 'control)   ; make Control key do Control
  ;; (setq ns-function-modifier 'hyper)  ; make Fn key do Hyper

  (setq default-input-method "MacOSX")
  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(1
                                    ((shift) . 5)
                                    ((control))))
  (dolist (multiple '("" "double-" "triple-"))
    (dolist (direction '("right" "left"))
      (global-set-key (kbd (concat "<" multiple "wheel-" direction ">")) 'ignore)))
  (global-set-key (kbd "M-`") 'ns-next-frame)
  (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
  (global-set-key (kbd "M-˙") 'ns-do-hide-others)
  (after-load 'nxml-mode
    (define-key nxml-mode-map (kbd "M-h") nil))
  (global-set-key (kbd "M-ˍ") 'ns-do-hide-others) ;; what describe-key reports for cmd-option-h
  )


(provide 'init-osx)
