;;;; File: lisp.el
;;;; elisp/lisp configurations

;; paredit for elisp editing
(defun enable-paredit ()
  (paredit-mode t))

(autoload 'paredit-mode "paredit" t)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit)
(add-hook 'ielm-mode-hook 'enable-paredit)
