(use-package clojure-mode
  :after (paredit)
  :hook (clojure-mode . my-lisp-mode-common-hook))

(use-package cider
  :after (clojure-mode)
  :hook
  ((cider-mode . my-lisp-mode-common-hook)
   (cider-repl-mode . (lambda ()
                        (my-lisp-mode-common-hook)
                        (setq-local nrepl-hide-special-buffers t)
                        (setq-local cider-repl-display-help-banner nil)))))

(defadvice 4clojure-open-question (around 4clojure-open-question-around)
  "Start a cider/nREPL connection if one hasn't already been
  started when opening 4clojure questions"
  ad-do-it
  (unless cider-current-clojure-buffer
    (cider-jack-in)))

(provide 'init-clojure)
