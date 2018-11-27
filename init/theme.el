(use-package color-theme-modern)

(use-package color-theme-approximate
  :config
  (progn
    (autoload 'color-theme-approximate-on "color-theme-approximate")
    (color-theme-approximate-on)))

(use-package nord-theme
  :hook (after-init . (lambda () (enable-theme 'nord)))
  :config
  (progn
    (load-theme 'nord t)
    (setq nord-comment-brightness 15)
    (setq nord-region-highlight "default")))

(defun default-theme-hook ()
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (add-to-list 'default-frame-alist '(foreground-color . "white")))

(when (not (package-installed-p 'color-theme))
  (add-hook 'after-init-hook 'default-theme-hook))
