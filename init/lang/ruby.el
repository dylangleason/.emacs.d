;;;; File : ruby.el
;;;; Configurations for editing ruby code

(defun my-ruby-mode-hook ()
  (add-to-list 'ac-modes 'enh-ruby-mode)
  (add-to-list 'ac-sources 'ac-source-etags)
  (flycheck-mode)
  (rubocop-mode)
  (yas-minor-mode))

(use-package enh-ruby-mode
  :mode "\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'"
  :interpreter "ruby"
  :hook (enh-ruby-mode . my-ruby-mode-hook)
  :config
  (setq enh-ruby-deep-indent-paren nil))

(use-package inf-ruby
  :after (enh-ruby-mode))

(use-package rinari
  :after (enh-ruby-mode))

(use-package robe
  :hook ((enh-ruby-mode . robe-mode)
         (enh-ruby-mode . ac-robe-setup)))

(use-package rspec-mode
  :after (enh-ruby-mode))

(defun my-rubocop-build-command (command path)
  (concat command
          (rubocop-build-requires)
          " "
          path))

(use-package rubocop
  :after (enh-ruby-mode)
  :config
  (progn
    (setq
     flycheck-ruby-rubocop-executable "/Users/dylangleason/.rbenv/shims/rubocop"
     rubocop-check-command "/Users/dylangleason/.rbenv/shims/rubocop --format emacs")
    (advice-add 'rubocop-build-command :override #'my-rubocop-build-command)))

(use-package yari
  :after (enh-ruby-mode))
