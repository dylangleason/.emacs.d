(use-package company
  :hook (after-init . global-company-mode))

(use-package dap-mode
  :bind ("C-c g" . dap-hydra)
  :config
  (dap-ui-controls-mode nil))

(use-package embark
  :demand t
  :bind
  (("C-c ." . embark-act)
   ("C-c ;" . embark-dwim)))

(use-package evil
  :demand t
  :init
  (setq evil-want-integration t
        evil-undo-system 'undo-tree)
  :config
  (push 'Info evil-emacs-state-modes)
  (push 'treemacs-mode evil-emacs-state-modes)
  (push 'vterm-mode evil-emacs-state-modes)
  (evil-mode t))

(use-package exec-path-from-shell
  :if (memq system-type '(darwin gnu/linux))
  :init
  (setq exec-path-from-shell-arguments nil
        exec-path-from-shell-check-startup-files nil)
  :config
  (exec-path-from-shell-initialize)
  :demand t)

(use-package info-colors
  :hook (Info-selection . info-colors-fontify-node))

(use-package flycheck)

(use-package flycheck-inline
  :after (flycheck))

(use-package graphviz-dot-mode
  :mode "\\.gv\\'")

(use-package lsp-mode
  :init
  (setq read-process-output-max 8192)
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(use-package lsp-treemacs
  :after (lsp-mode treemacs))

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

(use-package vterm
  :bind ("C-c t" . vterm)
  :hook
  (vterm-mode . (lambda () (setq-local line-spacing nil)))
  :config
  (set-terminal-coding-system 'utf-8))

(use-package nix-mode)

(use-package org-present)

(use-package projectile
  :init
  (bind-key "C-c p" 'projectile-command-map)
  (setq projectile-require-project-root t)
  :config
  (projectile-mode 1)
  :demand t)

(use-package treemacs)

(use-package treemacs-projectile
  :after
  (treemacs projectile)
  :bind
  ("C-c n" . treemacs))

(use-package undo-tree
  :demand t
  :config
  (global-undo-tree-mode 1))

(use-package whitespace
  :hook (before-save . whitespace-cleanup)
  :init
  (setq whitespace-style '(face tab-mark))
  :config
  (global-whitespace-mode 1)
  :ensure nil)

(use-package yaml-mode
  :mode "\\.yml\\'")

(provide 'init-packages)
