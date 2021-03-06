(use-package slime
  :after (paredit rainbow-delimiters)
  :defines slime-protocol-version
  :functions slime-setup
  :hook ((slime-mode . my-lisp-mode-common-hook)
         (slime-repl-mode . my-lisp-mode-common-hook))
  :init
  (setq inferior-lisp-program "sbcl"
        slime-protocol-version 'ignore)
  :config
  (slime-setup '(slime-repl
                 slime-asdf
                 slime-fancy
                 helm-slime
                 slime-company)))

(use-package slime-company
  :after (slime company)
  :config
  (setq slime-company-completion 'fuzzy))

(use-package helm-slime
  :after (helm slime))

(provide 'init-slime)
