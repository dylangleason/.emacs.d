;;;; File : gui.el
;;;; Settings for emacs when using window system

;; (defun set-neotree-font ()
;;   (let ((color (cdr (assq 'background-color (frame-parameters)))))
;;     (if (or (equal color "White")
;;             (equal color nil))
;;         (set-face-foreground neo-file-link-face "black")
;;       (set-face-foreground neo-file-link-face "white"))))

;; themes settings
(defun default-theme-hook ()
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (add-to-list 'default-frame-alist '(foreground-color . "white")))

(defun solarized-theme-hook ()
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (load-theme 'solarized t))

;; osx-specific settings
(when (memq window-system '(mac ns))
  (add-to-list 'load-path "/Applications/Emacs.app")
  (exec-path-from-shell-initialize)
  (setq mac-option-modifier 'meta))

;; initialize emacs gui
(when (display-graphic-p)
  (global-linum-mode 1)
  (set-default-font "Consolas-16")
  (add-hook 'after-init-hook 'solarized-theme-hook)
  (setq initial-frame-alist '((left . 0) (top . 0) (width . 184) (height . 52))))
