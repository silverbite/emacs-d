;;------------------------------------------------------------------------------
;; Ido related
;;------------------------------------------------------------------------------

;;
(require-package 'ggtags)

(require-package 'helm-gtags)


;; Enable helm-gtags-mode
(add-hook 'php-mode-hook 'helm-gtags-mode)
;; (add-hook 'c++-mode-hook 'helm-gtags-mode)
;; (add-hook 'asm-mode-hook 'helm-gtags-mode)

;; Set key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
;;     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "C-M-b") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-M-f") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))

(provide 'init-tags)
