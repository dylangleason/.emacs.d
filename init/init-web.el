(use-package web-mode
  :mode "\\.html?\\'"
  :config
  (setq web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-markup-indent-offset 2
        web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))))

(use-package haml-mode)

(use-package restclient
  :mode ("\\.http\\'" . restclient-mode))

(use-package restclient-helm
  :after (restclient))

(use-package restclient-test
  :after (restclient))

(use-package uuid
  :demand t)

(provide 'init-web)
