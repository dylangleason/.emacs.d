(use-package scheme
  :hook (scheme-mode . my-lisp-mode-common-hook))

(use-package geiser
  :after (scheme paredit)
  :defines (geiser-chez-binary
            geiser-guile-binary
            geiser-active-implementations
            geiser-repl-history-filename)
  :hook (geiser-repl-mode . my-lisp-mode-common-hook)
  :init
  (setq geiser-chez-binary "chez"
        geiser-guile-binary "guile"
        geiser-active-implementations '(chez guile)
        geiser-repl-history-filename "~/.emacs.d/geiser-history"))
