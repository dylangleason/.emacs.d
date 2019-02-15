(defun rtags-setup-hook ()
  (flycheck-select-checker 'rtags)
  (rtags-start-process-unless-running)
  (rtags-set-periodic-reparse-timeout 2.0))

(defun maybe-c-make-project-hook ()
  (when (file-exists-p "CMakeLists.txt")
    (cmake-project-mode)))

(defun my-c-mode-common-hook ()
  (setq c-basic-offset 4
        indent-tabs-mode nil
        flycheck-mode t)
  (c-set-offset 'case-label '+))

(defun my-c-mode-hook ()
  (c-set-style "k&r")
  (set (make-local-variable 'compile-command) "cmake"))

(defun my-c++-mode-hook ()
  (c-set-style "stroustrup")
  (set (make-local-variable 'compile-command) "cmake"))

(defun my-d-mode-hook ()
  (c-set-style "bsd")
  (set (make-local-variable 'compile-command) "dmd")
  (setq c-basic-offset 4))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c-mode-hook 'maybe-c-make-project-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c-mode-hook 'rtags-setup-hook)

(add-hook 'c++-mode-hook 'maybe-c-make-project-hook)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c++-mode-hook 'rtags-setup-hook)

(use-package d-mode
  :hook (d-mode . my-d-mode-hook))

(use-package rtags
  :config
  (progn
    (unless (rtags-executable-find "rc")
      (error "rc is not installed"))
    (unless (rtags-executable-find "rdm")
      (error "rdm is not installed"))
    (rtags-enable-standard-keybindings)
    (setq rtags-use-helm t)
    (add-hook 'kill-emacs-hook 'rtags-quit-rdm)))

(use-package helm-rtags
  :after (helm rtags)
  :config
  (setq rtags-display-result-backend 'helm))

(use-package ac-rtags
  :after (auto-complete rtags)
  :config
  (setq rtags-completions-enabled t))

(use-package flycheck-rtags
  :after (flycheck rtags))

(use-package cmake-project)
