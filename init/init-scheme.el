(use-package scheme
  :hook (scheme-mode . my-lisp-mode-common-hook)
  :ensure nil)

(use-package geiser
  :after (scheme paredit)
  :defines (geiser-guile-binary
            geiser-active-implementations
            geiser-repl-history-filename)
  :hook (geiser-repl-mode . my-lisp-mode-common-hook)
  :init
  (setq geiser-guile-binary "guile"
        geiser-active-implementations '(guile)
        geiser-repl-history-filename "~/.emacs.d/geiser-history")
  (exec-path-from-shell-copy-env "GUILE_LOAD_PATH"))

(provide 'init-scheme)
