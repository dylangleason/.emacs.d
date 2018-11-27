(use-package exec-path-from-shell
  :if (display-graphic-p)
  :config
  (progn
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH")))

;; macOS settings
(when (memq window-system '(mac ns))
  (add-to-list 'load-path "/Applications/Emacs.app")
  (set-face-attribute 'default nil :height 150)
  (setq mac-option-modifier 'meta))
