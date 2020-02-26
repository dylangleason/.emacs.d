(require 'cl-lib)

;;; Global variables and constants

(defconst dot-emacs-dir "~/.emacs.d/")
(defconst dot-emacs-init-dir (concat dot-emacs-dir "init/"))
(defconst dot-emacs-lisp-dir (concat dot-emacs-dir "lisp/"))

(eval-when-compile
  (defvar gnutls-algorithm-priority)
  (defvar mac-option-modifier))

(setq backup-by-copying t
      backup-directory-alist `(("." . ,(concat dot-emacs-dir "backup")))
      custom-file (concat dot-emacs-dir "custom.el")
      default-terminal-coding-system 'utf-8
      delete-old-versions t
      frame-resize-pixelwise t
      gc-cons-threshold (* 1024 1024 20)
      gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"
      inhibit-startup-message t
      kept-new-versions 5
      kept-old-versions 5
      load-prefer-newer t
      ring-bell-function 'ignore
      version-control t)

;;; Set global defaults for buffer-local variables

(setq-default case-fold-search nil
              indent-tabs-mode nil)

;;; Global settings

(global-font-lock-mode 1)
(global-prettify-symbols-mode 1)

;;; Set global keybindings

(global-set-key (kbd "C-c C-m") 'execute-extended-command)  ; M-x
(global-set-key (kbd "C-w") 'backward-kill-word)            ; M-DEL
(global-set-key (kbd "C-x C-k") 'kill-region)               ; C-k
(global-set-key (kbd "C-c C-k") 'kill-region)               ; C-k
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

;;; Turn off scroll bars and menus

(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(when (string-match "26" emacs-version)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

;;; MacOS settings

(when (memq window-system '(mac ns))
  (add-to-list 'load-path "/Applications/Emacs.app")
  (setq mac-option-modifier 'meta))

;;; Dired configurations

(put 'dired-find-alternate-file 'disabled nil)

;;; load paths

(add-to-list 'load-path dot-emacs-init-dir)
(add-to-list 'load-path dot-emacs-lisp-dir)

;;; Initialize packages and load files in init directory

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))
(require 'bind-key)

(load custom-file)

(defun require-init-files ()
  (cl-loop for file in (directory-files dot-emacs-init-dir)
           and prev = nil then file
           do (let ((curr (file-name-sans-extension file)))
                (unless (or (string-equal curr ".")
                            (string-equal curr "..")
                            (string-equal curr (file-name-sans-extension prev)))
                  (require (intern curr))))))
