(use-package slime
  :after (paredit rainbow-delimiters)
  :defines slime-protocol-version
  :functions slime-setup
  :hook ((slime-mode . my-lisp-mode-common-hook)
         (slime-repl-mode . my-lisp-mode-common-hook))
  :init
  (setq inferior-lisp-program "/usr/local/bin/sbcl"
        slime-protocol-version 'ignore)
  :config
  (slime-setup '(slime-repl slime-asdf slime-fancy helm-slime)))

(use-package ac-slime
  :after (auto-complete slime))

(use-package helm-slime
  :after (helm slime))
