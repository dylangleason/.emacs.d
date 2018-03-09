;;;; File : packages.el
;;;; Install default packages for assisting in development

;;; initialize package manager

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;; install use-package for easy package management

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;;; install default packages for development. NOTE: install
;;; language-specific packages via the "lang" directory for the
;;; specified language.

(use-package auto-complete
  :ensure t
  :load-path "~/.emacs.d/lisp"
  :config
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
  (ac-config-default))

(use-package color-theme
  :if (display-graphic-p)
  :ensure t)

(use-package color-theme-solarized
  :if (display-graphic-p)
  :after (color-theme)
  :ensure t
  :hook (after-init . solarized-theme-hook))

(use-package exec-path-from-shell
  :if (display-graphic-p)
  :ensure t
  :config
  (progn
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH")))

(use-package flycheck
  :ensure t)

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-c C-n" . mc/mark-next-like-this)
         ("C-c C-p" . mc/mark-previous-like-this)
         ("C-c C-a" . mc/mark-all-like-this))
  :ensure t)

(use-package multi-term
  :bind (("C-c t" . multi-term)
         ("M-[" . multi-term-prev)
         ("M-]" . multi-term-next))
  :ensure t
  :config
  (let ((zsh  "/bin/zsh")
        (bash "/bin/bash"))
    (if (file-exists-p zsh)
        (setq multi-term-program zsh)
      (setq multi-term-program bash))))

(use-package neotree
  :bind ("C-c n" . neotree-toggle)
  :ensure t
  :config
  (when (not (display-graphic-p))
    (set-face-foreground neo-file-link-face "white")))

(use-package whitespace
  :ensure t
  :hook (before-save . whitespace-cleanup)
  :config
  (progn
    (setq whitespace-style '(empty lines-tail tabs tab-mark trailing))
    (global-whitespace-mode 1)))

(use-package yaml-mode
  :ensure t)

;;; Load vendored dependencies / custom repos not managed by ELPA

(defconst emacs-vendor-dir (concat emacs-dir "vendor/"))

(when (file-exists-p (concat emacs-vendor-dir "/standup-notes"))
  (add-to-list 'load-path (concat emacs-vendor-dir "standup-notes/"))
  (require 'standup-notes))
