(use-package eshell-git-prompt
  :config (eshell-git-prompt-use-theme 'robbyrussell))

(use-package color-theme-approximate
  :if (string-equal system-type "gnu/linux")
  :config
  (progn
    (autoload 'color-theme-approximate-on "color-theme-approximate")
    (color-theme-approximate-on)))

(use-package color-theme-sanityinc-tomorrow
  :init
  (load-theme 'sanityinc-tomorrow-night t nil)
  :config
  (unless (display-graphic-p)
    (let ((background-color "color-236"))
      (set-face-attribute 'magit-diff-file-heading-highlight nil
                          :background background-color)
      (set-face-attribute 'magit-diff-file-heading-highlight nil
                          :background background-color)
      (set-face-attribute 'magit-diff-hunk-heading nil
                          :background background-color)
      (set-face-attribute 'magit-diff-hunk-heading-highlight nil
                          :background background-color)
      (set-face-attribute 'mode-line nil
                          :background background-color)
      (set-face-attribute 'region nil
                          :background background-color)
      (set-face-attribute 'vertical-border nil
                          :foreground "color-234"
                          :background background-color))))

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
