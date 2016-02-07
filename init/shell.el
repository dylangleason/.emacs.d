;;;; File: shell.el
;;;; emacs shell customizations

(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; set keybindings for multiterm actions
(global-set-key "\C-ct" 'multi-term)
(global-set-key "\M-["  'multi-term-prev)
(global-set-key "\M-]"  'multi-term-next)

;; set shell path when using window system
(when (display-graphic-p)
  (exec-path-from-shell-initialize))
