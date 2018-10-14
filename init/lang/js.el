;;;; File : js.el
;;;; javascript and coffeescript settings

(use-package js-comint)

(use-package js2-mode
  :after (js-comint)
  :bind (:map js2-mode-map
              ("C-x C-e" . js-send-last-sexp)
              ("C-x M-x" . js-send-last-sexp-and-go)
              ("C-c C-r" . js-send-region)
              ("C-c C-b" . js-send-buffer-and-go)
              ("C-c b" . js-send-buffer)
              ("C-c l" . js-load-file-and-go))
  :hook (before-save . remove-tabs)
  :mode "\\.js\\'"
  :config
  (progn
    (autoload 'js2-mode "js2-mode" nil t)
    (setq js-indent-level 2
          indent-tabs-mode nil
          inferior-js-program-command "/usr/local/bin/node")
    (setenv "NODE_NO_READLINE" "1")))

(use-package coffee-mode
  :init
  (progn
    (setq whitespace-style '(
                             empty
                             indentation
                             lines-tail
                             space-before-tab
                             space-after-tab
                             tabs-mark
                             ))))
