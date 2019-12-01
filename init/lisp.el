(defun prettify-lambda ()
  (setq prettify-symbols-alist '(("lambda" . 955))))

(defun my-lisp-mode-common-hook ()
  (paredit-mode t)
  (prettify-lambda)
  (rainbow-delimiters-mode-enable)
  (eldoc-mode))

(setq ielm-noisy nil)

(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-common-hook)
(add-hook 'ielm-mode-hook 'my-lisp-mode-common-hook)
(add-hook 'lisp-mode-hook 'my-lisp-mode-common-hook)
(add-hook 'lisp-interaction-mode-hook 'my-lisp-mode-common-hook)

(use-package paredit)
(use-package rainbow-delimiters)
