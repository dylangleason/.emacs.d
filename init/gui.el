;;;; File : gui.el
;;;; Settings for emacs when using window system

;;; Hooks for setting themes in GUI Emacs

(defun default-theme-hook ()
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (add-to-list 'default-frame-alist '(foreground-color . "white")))

(when (and (display-graphic-p)
           (not (package-installed-p 'color-theme)))
  (add-hook 'after-init-hook 'default-theme-hook))

;;; macOS / Cocoa-specific settings

(when (memq window-system '(mac ns))
  (add-to-list 'load-path "/Applications/Emacs.app")
  (setq mac-option-modifier 'meta))
