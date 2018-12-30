(use-package color-theme)

(use-package color-theme-modern)

(use-package color-theme-approximate
  :config
  (progn
    (autoload 'color-theme-approximate-on "color-theme-approximate")
    (color-theme-approximate-on)))

(use-package eshell-git-prompt
  :config (eshell-git-prompt-use-theme 'robbyrussell))

(use-package nord-theme
  :init
  (setq nord-comment-brightness 10
        nord-region-highlight "default")
  :hook (after-init . (lambda () (enable-theme 'nord)))
  :config (load-theme 'nord t))

(use-package powerline
  :config
  (powerline-default-theme))

(defun default-theme-hook ()
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (add-to-list 'default-frame-alist '(foreground-color . "white")))

(when (not (package-installed-p 'color-theme))
  (add-hook 'after-init-hook 'default-theme-hook))
