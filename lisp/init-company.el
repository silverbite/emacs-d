;;------------------------------------------------------------------------------
;; Eclimd
;;------------------------------------------------------------------------------
;;; http://www.pygopar.com/my-java-android-and-eclim-setup/

(require-package 'emacs-eclim)
(require 'eclim)
(require 'eclimd)

;; Dont automatically saves the current buffer
;; (setq eclim-auto-save t)
(setq eclim-auto-save nil)

(setq eclimd-default-workspace "~/Documents/workspace") ;; Eclipse workspace

;; So emacs won't freeze waiting for eclimd to start
(setq eclimd-wait-for-process nil)

(custom-set-variables
 '(eclim-eclipse-dirs '("~/rajat/app/ide/eclipse/Eclipse.app/Contents/Eclipse"))
 '(eclim-executable "~/rajat/app/ide/eclipse/Eclipse.app/Contents/Eclipse/eclim"))

;; key-bindings
(define-key eclim-mode-map (kbd "C-c C-n") 'eclim-problems-next-same-window)
(define-key eclim-mode-map (kbd "C-c C-p")  'eclim-problems-previous-same-window)

(global-eclim-mode)

;;------------------------------------------------------------------------------
;; Company mode
;;------------------------------------------------------------------------------

(require-package 'company)
(require 'company)

(require-package 'company-emoji)
(add-to-list 'company-backends 'company-emoji)

;; I don't need tags :)
(delete 'company-etags company-backends)
(delete 'company-ctags company-backends)
(delete 'company-gtags company-backends)

;; (setq company-etags-ignore-case t)

;; Python autocomplete
(require-package 'company-anaconda)
(require 'company-anaconda)

(add-to-list 'company-backends 'company-anaconda)
(add-hook 'python-mode-hook 'anaconda-mode)

;; LaTeX
(require-package 'company-auctex)
(company-auctex-init)

(require-package 'company-edbi)
(add-to-list 'company-backends 'company-edbi)

;; Company web-mode
(require-package 'company-web)
(require 'company-web-html)                          ; load company mode html backend
(require 'company-web-jade)                          ; load company mode jade backend
(require 'company-web-slim)                          ; load company mode slim backend

(require-package 'company-go)
(require 'company-go)

;; Add gtags
;; (add-to-list 'company-backends 'company-gtags)

;; you may key bind, for example for web-mode:
;; (define-key web-mode-map (kbd "C-'") 'company-web-html)

(require-package 'readline-complete)
(add-to-list 'company-backends 'company-readline)

(require 'company-semantic)

(add-to-list 'company-backends 'company-semantic)

;; (push 'company-readline company-backends)

;; (require-package 'company-jedi)
;; This is a company-backend for emacs-jedi. Add this backend to the
;; Basic usage.
;; (add-to-list 'company-backends 'company-jedi)
;; Advanced usage.
;; (add-to-list 'company-backends '(company-jedi company-files))

(require-package 'company-go)
(add-to-list 'company-backends 'company-go)

(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers nil)

(setq company-tooltip-limit 20)

;; You can trim too long function signatures to the frame width.
;; (setq company-tern-meta-as-single-line t)

;; If you doesn't like inline argument annotations appear with corresponding identifiers,
;; then you can to set up the company align option.
(setq company-tooltip-align-annotations 't)

;;; Company dabbrev
;; (setq company-dabbrev-downcase nil)
;; (setq company-dabbrev-ignore-case t)
;; (setq company-dabbrev-code-ignore-case t)
;; (setq company-dabbrev-code-everywhere t)

;; (unless (face-attribute 'company-tooltip :background)
;;     (set-face-attribute 'company-tooltip nil :background "black" :foreground "gray40")
;;     (set-face-attribute 'company-tooltip-selection nil :inherit 'company-tooltip :background "gray15")
;;     (set-face-attribute 'company-preview nil :background "black")
;;     (set-face-attribute 'company-preview-common nil :inherit 'company-preview :foreground "gray40")
;;     (set-face-attribute 'company-scrollbar-bg nil :inherit 'company-tooltip :background "gray20")
;;     (set-face-attribute 'company-scrollbar-fg nil :background "gray40"))

(setq company-global-modes
        '(not
          comint-mode org-mode erc-mode))

;; (lazy-unset-key
;;  '("TAB")
;;  company-mode-map)                      ;卸载按键
;; (lazy-unset-key
;;  '("M-p" "M-n" "M-1"
;;    "M-2" "M-3" "M-4"
;;    "M-5" "M-6" "M-7"
;;    "M-8" "M-9" "M-0"
;;    "C-m")
;;  company-active-map)
;; (lazy-set-key
;;  '(
;;    ("M-h" . company-complete-common)    ;补全公共部分
;;    ("M-H" . company-complete-selection) ;补全选择的
;;    ("M-w" . company-show-location)      ;显示局部的
;;    ("M-s" . company-search-candidates)  ;搜索候选
;;    ("M-S" . company-filter-candidates)  ;过滤候选
;;    ("M-," . company-select-next)        ;下一个
;;    ("M-." . company-select-previous)    ;上一个
;;    )
;;  company-active-map
;;  )
;; (dolist (hook (list
;;                'emacs-lisp-mode-hook
;;                'lisp-mode-hook
;;                'lisp-interaction-mode-hook
;;                'scheme-mode-hook
;;                'c-mode-hook
;;                'c++-mode-hook
;;                'java-mode-hook
;;                'haskell-mode-hook
;;                'asm-mode-hook
;;                'emms-tag-editor-mode-hook
;;                'sh-mode-hook
;;                ))
;;   (add-hook hook 'company-mode))
;;
;; (add-to-list 'company-backends 'company-cmake)
;;      ;; can't work with TRAMP
;;      (setq company-backends (delete 'company-ropemacs company-backends))
;;      (setq company-backends (delete 'company-capf company-backends))
;;      ;; I don't like the downcase word in company-dabbrev
;;      ;; for languages use camel case naming convention
;;      (setq company-dabbrev-downcase nil)
;;      (setq company-show-numbers t)
;;      (setq company-begin-commands '(self-insert-command))
;;      (setq company-idle-delay 0.2)
;; (setq company-clang-insert-arguments nil)


;; More efficient key-bindings
;; https://github.com/anwyn/slime-company

(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
;; (define-key company-active-map (kbd "<tab>") 'company-complete)

(require 'company-emacs-eclim)
(company-emacs-eclim-setup)

;; Helm interface for company
;; Not working :(
;; (require-package 'helm-company)

;; (define-key company-mode-map (kbd "C-:") 'helm-company)
;; (define-key company-active-map (kbd "C-:") 'helm-company)


(global-company-mode t)

;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)
;; (global-semantic-idle-completions-mode 1)
;; (global-semantic-idle-summary-mode 1)
;; (semantic-mode 1)

(provide 'init-company)
