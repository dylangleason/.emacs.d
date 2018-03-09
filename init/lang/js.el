;;;; File : js.el
;;;; javascript settings

(use-package js-comint
  :ensure t)

(use-package js2-mode
  :bind (("C-x C-e" . js-send-last-sexp)
         ("C-x M-x" . js-send-last-sexp-and-go)
         ("C-c C-r" . js-send-region)
         ("C-c C-b" . js-send-buffer-and-go)
         ("C-c b" . js-send-buffer)
         ("C-c l" . js-load-file-and-go))
  :ensure t
  :hook (before-save . remove-tabs)
  :mode "\\.js\\'"
  :config
  (progn
    (autoload 'js2-mode "js2-mode" nil t)
    (setq js-indent-level 4
          indent-tabs-mode nil
          inferior-js-program-command "/usr/local/bin/node")
    (setenv "NODE_NO_READLINE" "1")))
