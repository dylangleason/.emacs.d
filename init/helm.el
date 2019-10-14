(use-package helm
  :config
  (progn
    (helm-mode 1)
    (setq helm-split-window-inside-p t)
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)))

(use-package helm-ag
  :after (helm))

(use-package helm-dash
  :after (helm)
  :config (setq helm-dash-browser-func 'eww))

(use-package helm-projectile
  :after (helm projectile)
  :config
  (helm-projectile-on))

(use-package helm-flx
  :init (helm-flx-mode +1)
  :after (helm)
  :config
  (setq helm-flx-for-helm-find-files t
        helm-flx-for-helm-locate t))
