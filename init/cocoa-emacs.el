;;;; File : cocoa-emacs.el
;;;; Settings for cocoa emacs

;; add cocoa emacs directory to path
(add-to-list 'load-path "/Applications/Emacs.app")

;; set cocoa GUI grame size
(setq initial-frame-alist
      '((left . 0) (top . 0) (width . 175) (height . 50)))

;; set option key as meta
(setq mac-option-modifier 'meta)

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

(when window-system
  (add-hook 'after-init-hook 'solarized-theme-hook)
  (set-default-font "Consolas-14"))
