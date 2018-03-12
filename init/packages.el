;;;; File : packages.el
;;;; Install default packages for assisting in development

;;; NOTE: install language-specific packages via the "lang" directory
;;; for the specified language.

(use-package auto-complete
  :load-path "~/.emacs.d/lisp"
  :config
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
  (ac-config-default))

(use-package color-theme
  :if (display-graphic-p))

(use-package color-theme-solarized
  :if (display-graphic-p)
  :after (color-theme)
  :hook (after-init . solarized-theme-hook))

(use-package exec-path-from-shell
  :if (display-graphic-p)
  :config
  (progn
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH")))

(use-package flycheck)

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-c C-n" . mc/mark-next-like-this)
         ("C-c C-p" . mc/mark-previous-like-this)
         ("C-c C-a" . mc/mark-all-like-this)))

(use-package multi-term
  :bind (("C-c t" . multi-term)
         ("M-[" . multi-term-prev)
         ("M-]" . multi-term-next))
  :config
  (let ((zsh  "/bin/zsh")
        (bash "/bin/bash"))
    (if (file-exists-p zsh)
        (setq multi-term-program zsh)
      (setq multi-term-program bash))))

(use-package neotree
  :bind ("C-c n" . neotree-toggle)
  :config
  (when (not (display-graphic-p))
    (set-face-foreground neo-file-link-face "white")))

(use-package projectile
  :config
  (setq projectile-enable-caching t
        projectile-indexing-method 'native))

(use-package whitespace
  :hook (before-save . whitespace-cleanup)
  :config
  (progn
    (setq whitespace-style '(empty lines-tail tabs tab-mark trailing))
    (global-whitespace-mode 1)))

(use-package yaml-mode)

;;; Load vendored dependencies / custom repos not managed by ELPA

(defconst emacs-vendor-dir (concat emacs-dir "vendor/"))

(when (file-exists-p (concat emacs-vendor-dir "/standup-notes"))
  (add-to-list 'load-path (concat emacs-vendor-dir "standup-notes/"))
  (require 'standup-notes))
