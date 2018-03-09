;;;; File: mysql.el
;;;; mysql customizations

;; start a new line comment in SQL. This is MySQL-specific.
(defun my-sql-mode-hook ()
  (modify-syntax-entry ?# "< b" sql-mode-syntax-table))

(add-hook 'sql-mode-hook 'my-sql-mode-hook)
