(use-package auto-complete
  :load-path "~/.emacs.d/lisp"
  :config
  (progn
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
    (ac-config-default)))

(use-package ac-etags
  :after (autocomplete)
  :config
  (progn
    (custom-set-variables
     '(ac-etags-requires 1))
    (eval-after-load "etags"
      '(progn
         (ac-etags-setup)))))

(use-package flycheck)

(use-package flycheck-inline)

(use-package helm
  :config
  (progn
    (helm-mode 1)
    (setq helm-split-window-inside-p t)
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)))

(use-package helm-ag
  :after (helm))

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

(use-package projectile
  :init
  (bind-key "C-c p" 'projectile-command-map)
  :config
  (progn
    (projectile-mode 1)
    (setq projectile-enable-caching t
          projectile-indexing-method 'native
          projectile-require-project-root t)))

(use-package undo-tree)

(use-package whitespace
  :hook (before-save . whitespace-cleanup)
  :config
  (progn
    (setq whitespace-style '(empty face trailing tab-mark))
    (global-whitespace-mode 1)))

(use-package yaml-mode
  :mode "\\.yml\\'")

(use-package yasnippet)
(use-package yasnippet-snippets :after (yasnippet))
