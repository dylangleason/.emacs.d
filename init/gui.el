(use-package exec-path-from-shell
  :if (display-graphic-p)
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  :config
  (progn
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH")))

(when (memq window-system '(mac ns))
  (add-to-list 'load-path "/Applications/Emacs.app")
  (setq mac-option-modifier 'meta))
