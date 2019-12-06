(use-package company
  :hook (after-init . global-company-mode))

(use-package exec-path-from-shell
  :if (memq system-type '(darwin gnu/linux))
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "ZSH"))

(use-package flycheck)
(use-package flycheck-inline)

(use-package graphviz-dot-mode)

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

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
  (set-terminal-coding-system 'utf-8))

(use-package neotree
  :bind ("C-c n" . neotree-toggle))

(use-package projectile
  :init
  (bind-key "C-c p" 'projectile-command-map)
  (setq projectile-require-project-root t)
  :config
  (projectile-mode 1))

(use-package undo-tree)

(use-package whitespace
  :hook (before-save . whitespace-cleanup)
  :init
  (setq whitespace-style '(face tab-mark))
  :config
  (global-whitespace-mode 1))

(use-package yaml-mode
  :mode "\\.yml\\'")

(use-package yasnippet)
(use-package yasnippet-snippets :after (yasnippet))
