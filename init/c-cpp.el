(eval-when-compile
  (defvar my-c-style-alist)
  (defvar flycheck-mode)
  (defun flycheck-select-checker (arg)))

(defun rtags-setup-hook ()
  (flycheck-select-checker 'rtags)
  (rtags-start-process-unless-running)
  (rtags-set-periodic-reparse-timeout 2.0))

(defun my-c-mode-common-hook ()
  (flycheck-mode)
  (setq-local compile-command "cmake")
  (setq-local indent-tabs-mode nil))

(defun my-c-mode-hook ()
  (c-set-style "my-c-style"))

(defun my-c++-mode-hook ()
  (c-set-style "my-c++-style"))

(setq my-c-style-alist '((c-basic-offset . 4)))

(c-add-style "my-c-style" (cons "k&r" my-c-style-alist))
(c-add-style "my-c++-style" (cons "stroustrup" my-c-style-alist))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c-mode-hook 'rtags-setup-hook)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c++-mode-hook 'rtags-setup-hook)

(use-package d-mode
  :hook (d-mode . my-d-mode-hook))

(use-package rtags
  :defines rtags-use-helm
  :functions rtags-executable-find
  :init
  (setq rtags-use-helm t)
  :config
  (unless (rtags-executable-find "rc")
    (warn "rc is not installed"))
  (unless (rtags-executable-find "rdm")
    (warn "rdm is not installed"))
  (rtags-enable-standard-keybindings))

(use-package helm-rtags
  :after (helm rtags)
  :init (setq rtags-display-result-backend 'helm))

(use-package company-rtags
  :after (company rtags)
  :init (setq rtags-completions-enabled t)
  :config
  (eval-after-load 'company-mode
    (add-to-list 'company-backends 'company-rtags)))

(use-package flycheck-rtags
  :after (flycheck rtags))
