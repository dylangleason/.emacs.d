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
  :mode "\\.js\\'"
  :interpreter ("/usr/local/bin/node" . js2-mode) 
  :init
  (setenv "NODE_NO_READLINE" "1")
  (setq js-indent-level 2
        indent-tabs-mode nil))


(use-package coffee-mode
  :defines whitespace-style
  :hook
  (coffee-mode . (lambda ()
                   (setq-local whitespace-style '(empty
                                                  indentation
                                                  lines-tail
                                                  space-before-tab
                                                  space-after-tab
                                                  tabs-mark)))))
