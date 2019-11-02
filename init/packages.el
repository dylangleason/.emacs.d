(use-package auto-complete
  :load-path "~/.emacs.d/ac-dict"
  :config
  (progn
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
    (ac-config-default)))

(use-package ac-etags
  :after (auto-complete)
  :config
  (progn
    (custom-set-variables
     '(ac-etags-requires 1))
    (eval-after-load "etags"
      '(progn
         (ac-etags-setup)))))

(use-package exec-path-from-shell
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  :config
  (progn
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH")))

(use-package flycheck)
(use-package flycheck-inline)

(use-package graphviz-dot-mode)

(use-package magit
  :init
  (bind-key "C-x g" 'magit-status))

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

(use-package neotree)

(use-package projectile
  :init
  (bind-key "C-c p" 'projectile-command-map)
  :config
  (projectile-mode 1)
  (setq projectile-require-project-root t))

(use-package undo-tree)

(use-package whitespace
  :hook (before-save . whitespace-cleanup)
  :config
  (progn
    (setq whitespace-style '(face tab-mark))
    (global-whitespace-mode 1)))

(use-package yaml-mode
  :mode "\\.yml\\'")

(use-package yasnippet)
(use-package yasnippet-snippets :after (yasnippet))
