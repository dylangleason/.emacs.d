(unless (display-graphic-p)
  (add-to-list 'custom-theme-load-path (concat dot-emacs-dir "themes")))

(use-package color-theme-approximate
  :if (string-equal system-type "gnu/linux")
  :config
  (autoload 'color-theme-approximate-on "color-theme-approximate")
  (color-theme-approximate-on))

(use-package base16-theme)
(use-package color-theme-sanityinc-tomorrow)

(defvar my-projectile-mode-line
  '(:propertize
    (:eval (when (ignore-errors (projectile-project-root))
             (concat "projectile: " (projectile-project-name))))))

(put 'my-projectile-mode-line 'risky-local-variable t)

(setq-default mode-line-format
              '("%e %l"
                "  " mode-line-modified
                "  " mode-line-buffer-identification
                "  " my-projectile-mode-line
                "  " (vc-mode vc-mode)))

(provide 'init-theme)
