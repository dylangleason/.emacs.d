;;; File : js.el
;;; javascript settings

;; Install javascript packages
;; (unless (package-installed-p 'js-comint)
;;   (package-install 'js-comint))

;; (unless (package-installed-p 'js2-mode)
;;   (package-install 'js2-mode))

(packages-require
 'js-comint
 'js2-mode)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq inferior-js-program-command "/usr/local/bin/node")
(setenv "NODE_NO_READLINE" "1")

(defun remove-tabs ()
  (untabify (point-min) (point-max)))

(defun my-js-mode-hook ()
  (setq js-indent-level 4)
  (setq indent-tabs-mode nil)
  (local-set-key "\C-x\C-e" 'js-send-last-sexp)
  (local-set-key "\C-x\M-x" 'js-send-last-sexp-and-go)
  (local-set-key "\C-c\C-r" 'js-send-region)
  (local-set-key "\C-cb"    'js-send-buffer)
  (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
  (local-set-key "\C-cl"    'js-load-file-and-go)
  (add-hook 'before-save-hook 'remove-tabs))

(add-hook 'js-mode-hook 'my-js-mode-hook)
(add-hook 'js2-mode-hook 'my-js-mode-hook)
