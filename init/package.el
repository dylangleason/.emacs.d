;;;; File : package.el
;;;; Configure pacakge repos and install dependencies

;; init package manager
(require 'package)
(add-to-list 'load-path (concat emacs-dir "elpa/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(package-initialize)

;; install packages
(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete))

(unless (package-installed-p 'cider)
  (package-install 'clojure-mode))

(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

(unless (package-installed-p 'exec-path-from-shell)
  (package-install 'exec-path-from-shell))

(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))

(unless (package-installed-p 'go-autocomplete)
  (package-install 'go-autocomplete))

(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))

(unless (package-installed-p 'flycheck-gometalinter)
  (package-install 'flycheck-gometalinter))

(unless (package-installed-p 'multi-term)
  (package-install 'multi-term))

(unless (package-installed-p 'neotree)
  (package-install 'neotree))

(unless (package-installed-p 'whitespace)
  (package-install 'whitespace))

(unless (package-installed-p 'web-mode)
  (package-install 'web-mode))
