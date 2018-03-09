;; (packages-require
;;  'inf-ruby
;;  'rinari
;;  'rubocop)

;; (add-to-list 'auto-mode-alist
;;              '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
;; (add-to-list 'auto-mode-alist
;;              '("\\.\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?|[rR]akefile\\)\\'" . ruby-mode))

;; (add-hook 'ruby-mode-hook
;;           (lambda () (setq flycheck-mode t)))

(use-package ruby-mode
  :mode "\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\|?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?|[rR]akefile\\)\\'"
  :hook (ruby-mode . (lambda () (setq flycheck-mode t))))

(use-package inf-ruby
  :ensure t
  :after (ruby-mode))

(use-package rinari
  :ensure t
  :after (ruby-mode))

(use-package rubocop
  :ensure t
  :after (ruby-mode))
