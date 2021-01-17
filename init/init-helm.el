(use-package helm
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files))
  :init
  (setq helm-split-window-inside-p t)
  :config
  (helm-mode 1))

(use-package helm-ag
  :after (helm))

(use-package helm-dash
  :after (helm)
  :init (setq dash-browser-func 'eww))

(use-package helm-lsp
  :after (helm lsp-mode))

(use-package helm-projectile
  :after (helm projectile)
  :config
  (helm-projectile-on))

(use-package helm-flx
  :config (helm-flx-mode +1)
  :after (helm)
  :init
  (setq helm-flx-for-helm-find-files t
        helm-flx-for-helm-locate t))

(provide 'init-helm)
