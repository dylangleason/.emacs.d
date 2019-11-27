(defun prettify-lambda ()
  (setq prettify-symbols-alist '(("lambda" . 955))))

(defun my-lisp-mode-common-hook ()
  (paredit-mode t)
  (prettify-lambda)
  (rainbow-delimiters-mode-enable)
  (eldoc-mode))

(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-common-hook)
(add-hook 'lisp-mode-hook 'my-lisp-mode-common-hook)
(add-hook 'lisp-interaction-mode-hook 'my-lisp-mode-common-hook)

(use-package paredit)

(use-package rainbow-delimiters)

(use-package slime
  :after (paredit)
  :defines (slime-inferior-lisp-program slime-protocol-version) 
  :functions slime-setup
  :hook ((slime-mode . my-lisp-mode-common-hook)
         (slime-repl-mode . my-lisp-mode-common-hook))
  :init
  (setq inferior-lisp-program "/usr/local/bin/sbcl"
        slime-protocol-version 'ignore)
  :config
  (slime-setup '(slime-repl slime-asdf slime-fancy)))
