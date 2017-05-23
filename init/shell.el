;;;; File: shell.el
;;;; emacs shell customizations

;; Install multi-term
(unless (package-installed-p 'multi-term)
  (package-install 'multi-term))

(require 'multi-term)

;; Set the default shell to use
(let ((zsh  "/bin/zsh")
      (bash "/bin/bash"))
  (if (file-exists-p zsh)
      (setq multi-term-program zsh)
    (setq multi-termp-program bash)))

;; set keybindings for multiterm actions
(global-set-key "\C-ct" 'multi-term)
(global-set-key "\M-[" 'multi-term-prev)
(global-set-key "\M-]" 'multi-term-next)

;; set shell path when using window system
(when (display-graphic-p)
  (exec-path-from-shell-initialize))
