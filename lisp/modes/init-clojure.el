;;------------------------------------------------------------------------------
;; Clojure mode
;;------------------------------------------------------------------------------
;;https://github.com/NicolasPetton/emacs.d/blob/master/init/init-clojure.el

(require-package 'clojure-mode)
(require-package 'cider)
(require-package 'clj-refactor)


(setq nrepl-popup-stacktraces nil)

;; By default, interactive commands that require a symbol will prompt for the symbol,
;; with the prompt defaulting to the symbol at point.
(setq cider-prompt-for-symbol nil)

;; Use <tab> to indent the code
(setq cider-repl-tab-command #'indent-for-tab-command)

;; Change the result prefix for REPL evaluation (by default there's no prefix):
;; (setq cider-repl-result-prefix ";; => ")

(add-to-list 'same-window-buffer-names "<em>nrepl</em>")

(cljr-add-keybindings-with-prefix "C-c C-r")

(defun setup-clojure-buffer ()
  (turn-on-eldoc-mode)
  (clj-refactor-mode 1)
  (paredit-mode 1)
  (setq indent-tabs-mode nil))

(setq cider-repl-use-clojure-font-lock t
      cider-interactive-eval-result-prefix ";; => ")

(add-hook 'clojure-mode-hook #'setup-clojure-buffer)
(add-hook 'cider-mode-hook #'cider-turn-on-eldoc-mode)


(provide 'init-clojure)
