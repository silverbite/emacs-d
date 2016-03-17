(require 'org-agenda)

(setq org-agenda-span 14)

;; http://zeekat.nl/articles/making-emacs-work-for-me.html
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i)" "PENDING(p)" "MEETING(m)" "|" "DONE(d)" "CANCELED(c)")))

(defun my-org-autodone (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'my-org-autodone)

(setq org-refile-targets '((nil :level . 1)
                           (org-agenda-files :level . 1)))


(setq-default org-src-fontify-natively t)

(require-package 'htmlize)

(provide 'init-org)
