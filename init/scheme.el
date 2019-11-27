(add-hook 'scheme-mode-hook 'my-lisp-mode-common-hook)

(use-package geiser
  :defines (geiser-chez-binary
            geiser-guile-binary
            geiser-active-implementations
            geiser-repl-history-filename)
  :after (scheme paredit)
  :hook (geiser-repl-mode . my-lisp-mode-common-hook)
  :init
  (setq geiser-chez-binary "/usr/local/bin/chez"
        geiser-guile-binary "/usr/local/bin/guile"
        geiser-active-implementations '(chez chicken guile)
        geiser-repl-history-filename "~/.emacs.d/geiser-history"))
