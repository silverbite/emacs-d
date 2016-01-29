;;------------------------------------------------------------------------------
;; Ruby mode
;;------------------------------------------------------------------------------
(require-package 'ruby-mode)

;; http://www.emacswiki.org/emacs/RubyMode
(add-to-list 'auto-mode-alist
             '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(require-package 'rvm)
(require-package 'robe)

(add-hook 'ruby-mode-hook 'robe-mode)

(push 'company-robe company-backends)

;; https://github.com/dgutov/robe#integration-with-rvmel
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(provide 'init-ruby)

