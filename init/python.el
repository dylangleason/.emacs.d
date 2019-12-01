(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))

(use-package elpy
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))
