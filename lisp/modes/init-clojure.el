;;------------------------------------------------------------------------------
;; Clojure mode
;;------------------------------------------------------------------------------
;;https://github.com/NicolasPetton/emacs.d/blob/master/init/init-clojure.el

(require-package 'clojure-mode)
(require 'clojure-mode)

(require-package 'cider)
(require 'cider)

(require-package 'clj-refactor)
(require 'clj-refactor)

(require-package 'paredit)
(require 'paredit)

(require-package 'rainbow-delimiters)
(require 'rainbow-delimiters)

(require-package 'rainbow-mode)
(require 'rainbow-mode)

(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

;; Show parenthesis mode
(show-paren-mode 1)

(setq nrepl-popup-stacktraces nil)

(add-to-list 'same-window-buffer-names "<em>nrepl</em>")


(add-hook 'clojure-mode-hook #'setup-clojure-buffer)
(add-hook 'cider-mode-hook #'cider-turn-on-eldoc-mode)

(cljr-add-keybindings-with-prefix "C-c C-r")

(defun setup-clojure-buffer ()
  (turn-on-eldoc-mode)
  (clj-refactor-mode 1)
  (paredit-mode 1)
  (setq indent-tabs-mode nil))

(setq cider-repl-use-clojure-font-lock t
      cider-interactive-eval-result-prefix ";; => ")


(provide 'init-clojure)
