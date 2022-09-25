;;; -*- lexical-binding: t -*-

;;; Global configurations

(eval-when-compile
  (defvar mac-option-modifier))

(defun my-line-numbers-mode ()
  (display-line-numbers-mode)
  (setq display-line-numbers-type 'visual))

(when (version< emacs-version "27")
  (load (concat user-emacs-directory) "early-init"))

(unless (version< emacs-version "26")
  (add-hook 'prog-mode-hook 'my-line-numbers-mode))

(setq backup-by-copying t
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backup")))
      delete-old-versions t
      kept-new-versions 5
      kept-old-versions 5
      version-control t)

(setq load-prefer-newer t
      read-process-output-max (* 1024 1024))

(setq ring-bell-function 'ignore)

(setq-default case-fold-search nil
              indent-tabs-mode nil)

(let ((custom-file-path (concat user-emacs-directory "custom.el")))
  (setq custom-file custom-file-path)
  (load custom-file-path t))

(prefer-coding-system 'utf-8)
(put 'dired-find-alternate-file 'disabled nil)

(global-prettify-symbols-mode 1)
(global-set-key (kbd "C-w") 'backward-kill-word)            ; M-DEL
(global-set-key (kbd "C-x C-k") 'kill-region)               ; C-k
(global-set-key (kbd "C-c C-k") 'kill-region)               ; C-k
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

;;; macOS settings

(when (memq window-system '(mac ns))
  (add-to-list 'load-path "/Applications/Emacs.app")
  (setq mac-option-modifier 'meta))

;;; Initialize packages

(with-eval-after-load 'package
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")))

(when (version< emacs-version "27")
  (package-initialize))

(unless (package-installed-p 'use-package)  
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-defer t)
  (setq use-package-always-ensure t))

;;; Add additional elisp directories to `load-path' and require init
;;; files in the `init' directory

(add-to-list 'load-path (concat user-emacs-directory "init"))
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

(defun require-init-files ()
  (cl-loop for file in (directory-files (concat user-emacs-directory "init"))
           and prev = nil then file
           do (let ((curr (file-name-sans-extension file)))
                (unless (or (string-equal curr ".")
                            (string-equal curr "..")
                            (string-equal curr (file-name-sans-extension prev)))
                  (require (intern curr))))))

(require-init-files)
