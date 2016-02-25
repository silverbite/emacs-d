;;; xt-utils.el --- Utilities
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:

(defun xt/delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun xt/rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (when (file-exists-p filename)
         (rename-file filename new-name 1))
        (rename-buffer new-name)
        (set-visited-file-name new-name)))))

;; Copied from https://github.com/bbatsov/prelude/blob/master/core/prelude-core.el
(defun xt/eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (let ((value (eval (preceding-sexp))))
    (backward-kill-sexp)
    (insert (format "%s" value))))

(defun xt/delete-tern-process ()
  "Terminate tern process."
  (interactive)
  (delete-process "Tern"))

(defun xt/gtags-root-dir ()
  "Gets GTAGS root directory or nil if doesn't exist."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))

(defun xt/gtags-update ()
  "Make GTAGS incremental update."
  (call-process "global" nil nil nil "-u"))

(defun xt/gtags-update-hook ()
  "Update gtags."
  (when (xt/gtags-root-dir)
    (xt/gtags-update)))

;; (add-hook 'after-save-hook #'xt/gtags-update-hook)

(defun xt/php-cs-fix ()
  "Fix php."
  (interactive)
  (progn (shell-command (concat "php-cs-fixer fix " (buffer-file-name) " -v"))
     (revert-buffer nil t)))


(provide 'xt-utils)

;;; xt-utils.el ends here
