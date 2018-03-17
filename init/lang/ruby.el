;;;; File : ruby.el
;;;; Configurations for editing ruby code

(use-package enh-ruby-mode
  :mode "\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'"
  :interpreter "ruby"
  :hook ((enh-ruby-mode . rubocop-mode)
         (enh-ruby-mode . flycheck-mode))
  :config
  (setq enh-ruby-deep-indent-paren nil
        flycheck-ruby-rubocop-executable "~/.rbenv/shims/rubocop"))

(use-package inf-ruby
  :after (enh-ruby-mode))

(use-package rinari
  :after (enh-ruby-mode))

(use-package rspec-mode
  :after (enh-ruby-mode))

(use-package rubocop
  :after (enh-ruby-mode))

(use-package yari
  :after (enh-ruby-mode))
