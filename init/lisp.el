;;;; File : lisp.el
;;;; Elisp, Common Lisp, Clojure and SLIME configurations

;; paredit for lisp editing
(packages-require
 'paredit
 'rainbow-delimiters)

(defun my-lisp-mode-common-hook ()
  (paredit-mode t)
  (rainbow-delimiters-mode-enable))

;; add hooks for elisp
(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-common-hook)

;; Setup SBCL and slime, assuming slime is installed
(when (file-exists-p "~/quicklisp/slime-helper.el")
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (require 'slime)
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-protocol-version 'ignore)
  (slime-setup '(slime-repl slime-asdf slime-fancy slime-banner))
  (add-hook 'slime-mode-hook (paredit-mode t)))

(add-hook 'lisp-mode-hook 'my-lisp-mode-common-hook)
(add-hook 'lisp-interaction-mode-hook 'my-lisp-mode-common-hook)

;; Setup Clojure and CIDER
(packages-require
 'cider
 'clojure-mode)

(defun my-cider-repl-mode-hook ()
  (setq-local nrepl-hide-special-buffers t)
  (setq-local cider-repl-display-help-banner nil)
  (eldoc-mode))

;; configure cider IDE and nREPL
(add-hook 'cider-mode-hook 'my-lisp-mode-common-hook)
(add-hook 'clojure-mode-hook 'my-lisp-mode-common-hook)
(add-hook 'cider-repl-mode-hook 'my-cider-repl-mode-hook)

(defadvice 4clojure-open-question (around 4clojure-open-question-around)
  "Start a cider/nREPL connection if one hasn't already been
  started when opening 4clojure questions"
  ad-do-it
  (unless cider-current-clojure-buffer
    (cider-jack-in)))

;; Setup Scheme / Racket
(packages-require
 'geiser
 'quack)

(defun my-scheme-mode-hook ()
  (my-lisp-mode-common-hook)
  (setq quack-fontify-style 'emacs))

(add-hook 'scheme-mode-hook 'my-scheme-mode-hook)
(setq geiser-active-implementations '(guile racket))
(setq geiser-repl-history-filename "~/.emacs.d/geiser-history")
