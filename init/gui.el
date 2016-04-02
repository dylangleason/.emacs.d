;;;; File : gui.el
;;;; Settings for emacs when using window system

;; themes
(defun default-theme-hook ()
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (add-to-list 'default-frame-alist '(foreground-color . "white")))

(defun solarized-theme-hook ()
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (load-theme 'solarized t))

(defun monokai-theme-hook ()
  (load-theme 'monokai t))

(defun misterioso-theme-hook ()
  (load-theme 'misterioso t))

;; osx-specific settings
(when (memq window-system '(mac ns))
  (add-to-list 'load-path "/Applications/Emacs.app")
  (setq mac-option-modifier 'meta))

;; load custom theme after initialization
(when (display-graphic-p)
  (global-linum-mode 1)
  (add-hook 'after-init-hook 'solarized-theme-hook)
  (setq initial-frame-alist '((left . 0) (top . 0) (width . 184) (height . 52))))
