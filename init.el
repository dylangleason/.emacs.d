;;; Global constants

(defconst emacs-dir "~/.emacs.d/")
(defconst init-dir (concat emacs-dir "init/"))
(defconst lisp-dir (concat emacs-dir "lisp/"))

;;; Set global variables

(setq lexical-bindings t
      default-terminal-coding-system 'utf-8
      inhibit-startup-message t
      custom-file (concat init-dir "custom.el")
      case-fold-search nil
      backup-directory-alist `(("." . ,(concat emacs-dir "backup")))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 20
      kept-old-versions 10
      load-prefer-newer t
      gc-cons-threshold (* 1024 1024 20))

(setq-default indent-tabs-mode nil)

;;; Set global keybindings

(global-set-key "\C-x\C-m" 'execute-extended-command)  ; M-x
(global-set-key "\C-c\C-m" 'execute-extended-command)  ; M-x
(global-set-key "\C-w" 'backward-kill-word)            ; M-DEL
(global-set-key "\C-x\C-k" 'kill-region)               ; C-k
(global-set-key "\C-c\C-k" 'kill-region)               ; C-k
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)

(global-font-lock-mode 1)
(global-prettify-symbols-mode 1)

;;; Turn off scroll bars and menus

(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;; MacOS settings

(when (memq window-system '(mac ns))
  (add-to-list 'load-path "/Applications/Emacs.app")
  (setq mac-option-modifier 'meta))

;;; Dired configurations

(put 'dired-find-alternate-file 'disabled nil)

;;; Load files in init directory, including helper functions,
;;; packages, and language specific configurations.

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

(defun load-user-file (file dir)
  "Load a user file interactively
FILE the name of the file to load"
  (interactive "f")
  (load-file (expand-file-name file dir)))

(defun load-directory-files (dir)
  "Recursively load files in DIR. Checks to see if byte-compiled
lisp files exist and will load those. Otherwise, load normal lisp
files and compile for subsequent loads."
  (mapc (lambda (file)
          (let ((path (expand-file-name file dir)))
            (if (file-directory-p path)
                (load-directory-files path)
              (when (string-match "^\\(.+\.elc\\)$" file)
                (load-file path)))))
        (cddr (directory-files dir))))

(byte-recompile-directory init-dir 0)
(load-directory-files init-dir)
