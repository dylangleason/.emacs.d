;;;; File : lisp.el
;;;; Elisp, Common Lisp, Clojure and SLIME configurations

;; paredit for lisp editing
(unless (package-installed-p 'paredit)
  (package-install 'paredit))

(require 'paredit)

(defun enable-paredit ()
  (paredit-mode t))

;; add hooks for builtin lisp modes
(add-hook 'emacs-lisp-mode-hook 'enable-paredit)
(add-hook 'ielm-mode-hook 'enable-paredit)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit)
(add-hook 'lisp-mode-hook 'enable-paredit)

;; Setup SBCL and slime, assuming slime is installed
(when (file-exists-p "~/quicklisp/slime-helper.el")
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (require 'slime)
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-protocol-version 'ignore)
  (slime-setup '(slime-repl slime-asdf slime-fancy slime-banner))
  (add-hook 'slime-mode-hook 'enable-paredit))

;; Setup Clojure and CIDER
(unless (package-installed-p 'cider)
  (package-install 'cider))

(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

(defun my-cider-repl-mode-hook ()
  (setq-local nrepl-hide-special-buffers t)
  (setq-local cider-repl-display-help-banner nil)
  (enable-paredit)
  (eldoc-mode))

;; configure cider IDE and nREPL
(require 'cider)
(add-hook 'cider-mode-hook 'eldoc-mode)
(add-hook 'clojure-mode-hook 'enable-paredit)
(add-hook 'cider-repl-mode-hook 'my-cider-repl-mode-hook)
