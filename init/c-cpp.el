(defun rtags-setup-hook ()
  (flycheck-select-checker 'rtags)
  (rtags-start-process-unless-running)
  (rtags-set-periodic-reparse-timeout 2.0))

(defun maybe-c-make-project-hook ()
  (when (file-exists-p "CMakeLists.txt")
    (cmake-project-mode)))

(defun my-c-mode-common-hook ()
  (setq flycheck-mode t
        indent-tabs-mode nil))

(setq my-c-style-alist '((c-basic-offset . 4)
                         (c-offsets-alist (case-label . +))))

(c-add-style "my-c-style" (cons "k&r" my-c-style-alist))
(c-add-style "my-c++-style" (cons "stroustrup" my-c-style-alist))
(c-add-style "my-d-style" (cons "bsd" my-c-style-alist))

(defun my-c-mode-hook ()
  (c-set-style "my-c-style")
  (set (make-local-variable 'compile-command) "cmake"))

(defun my-c++-mode-hook ()
  (c-set-style "my-c++-style")
  (set (make-local-variable 'compile-command) "cmake"))

(defun my-d-mode-hook ()
  (c-set-style "my-d-style")
  (set (make-local-variable 'compile-command) "dmd"))

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
      (warn "rc is not installed"))
    (unless (rtags-executable-find "rdm")
      (warn "rdm is not installed"))
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
