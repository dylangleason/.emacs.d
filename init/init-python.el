(use-package python
  :defines (flycheck-mode flycheck-python-pylint-executable)
  :hook (python-mode . (lambda ()
                         (flycheck-mode)
                         (lsp)))
  :init
  (setq flycheck-python-pylint-executable "~/.pyenv/shims/python")
  :interpreter ("python" . python-mode)
  :mode ("\\.py\\'" . python-mode))

(use-package hy-mode
  :after (python)
  :hook (hy-mode . my-lisp-mode-common-hook))

(use-package py-test
  :after (python))

(provide 'init-python)
