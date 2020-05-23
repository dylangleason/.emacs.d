(use-package python
  :defines (flycheck-mode
            flycheck-disabled-checkers
            flycheck-python-flake8-executable)
  :hook (python-mode . flycheck-mode)
  :init
  (setq flycheck-python-flake8-executable "~/.pyenv/shims/python")
  (setq-default flycheck-disabled-checkers '(python-pylint))
  :interpreter ("python" . python-mode)
  :mode ("\\.py\\'" . python-mode))

(use-package py-test
  :after (python))

(use-package elpy
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(use-package pipenv
  :defines (pipenv-projectile-after-switch-function)
  :hook (python-mode . pipenv-mode)
  :init
  (setq pipenv-projectile-after-switch-function
        #'pipenv-projectile-after-switch-extended))

(use-package hy-mode
  :after (python)
  :hook (hy-mode . my-lisp-mode-common-hook)
  :mode ("\\.hy\\'" . hy-mode))

(provide 'init-python)
