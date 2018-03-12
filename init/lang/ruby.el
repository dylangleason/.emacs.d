;;;; File : ruby.el
;;;; Configurations for editing ruby code

(use-package ruby-mode
  :mode "\\.rb\\'"
  :interpreter "ruby"
  :hook (ruby-mode . rubocop-mode))

(use-package inf-ruby
  :after (ruby-mode))

(use-package rinari
  :after (ruby-mode))

(use-package rspec-mode
  :after (ruby-mode))

(use-package rubocop
  :after (ruby-mode))
