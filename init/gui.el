(use-package exec-path-from-shell
  :if (display-graphic-p)
  :config
  (progn
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH")))

(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :family "DejaVu Sans Mono for Powerline"
                      :height 150))

(when (memq window-system '(mac ns))
  (add-to-list 'load-path "/Applications/Emacs.app")
  (setq mac-option-modifier 'meta))
