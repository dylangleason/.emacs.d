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
  :hook (after-init . (lambda () (load-theme 'wombat))))

(use-package exec-path-from-shell
  :if (display-graphic-p)
  :config
  (progn
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH")))

(use-package flycheck)

(use-package helm
  :config
  (progn
    (helm-mode 1)
    (global-set-key (kbd "M-x") 'helm-M-x)))

(use-package magit)

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-c C-n" . mc/mark-next-like-this)
         ("C-c C-p" . mc/mark-previous-like-this)
         ("C-c C-a" . mc/mark-all-like-this)))

(use-package multi-term
  :bind (("C-c t" . multi-term)
         ("C-c [" . multi-term-prev)
         ("C-c ]" . multi-term-next))
  :config
  (let ((zsh  "/bin/zsh")
        (bash "/bin/bash"))
    (set-terminal-coding-system 'utf-8)
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

(use-package yasnippet)

(use-package yasnippet-snippets :after (yasnippet))

;;; Load vendored dependencies / custom repos not managed by ELPA

(defun load-vendor-dep (vendor-path pkg)
  (when (file-exists-p vendor-path)
    (add-to-list 'load-path (concat vendor-path "/"))
    (require (intern pkg))))

(defun load-vendor-deps ()
  ;; NOTE: this assumes that the subdirectory name in vendor and
  ;; package name are the same.
  (let ((vendor-dir (concat emacs-dir "vendor")))
    (mapc (lambda (dir)
            (unless (string-match "^\\(\.\\|\.\.\\)$" dir)
              (load-vendor-dep (concat vendor-dir "/" dir) dir)))
          (directory-files vendor-dir))))

(load-vendor-deps)
