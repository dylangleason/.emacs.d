(unless (display-graphic-p)
  (add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes")))

(use-package color-theme-approximate
  :if (string-equal system-type "gnu/linux")
  :config
  (autoload 'color-theme-approximate-on "color-theme-approximate")
  (color-theme-approximate-on))

(use-package base16-theme)
(use-package color-theme-sanityinc-tomorrow)

(add-to-list 'load-path (concat user-emacs-directory "lisp/mood-line"))

(use-package mood-line
  :demand t
  :ensure nil
  :config
  (mood-line-mode))

(use-package all-the-icons
  :demand t
  :if (display-graphic-p))

(provide 'init-theme)
