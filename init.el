;;;; File: init.el
;;;; Emacs initialization file

;;; Global constants

(defconst emacs-dir "~/.emacs.d/")
(defconst emacs-init-dir (concat emacs-dir "init/"))
(defconst emacs-lang-dir (concat emacs-init-dir "lang/"))

;;; Set global variables

(setq lexical-bindings t
      default-terminal-coding-system 'utf-8
      inhibit-startup-message t
      custom-file (concat emacs-init-dir "custom.el")
      case-fold-search nil
      backup-directory-alist `(("." . ,(concat emacs-dir "backup")))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 20
      kept-old-versions 10)

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

;;; Turn off scroll bars and menus

(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

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

(defun expand-user-file (file dir)
  "Expand the user file name
FILE the name of the file to expand"
  (expand-file-name file dir))

(defun load-user-file (file dir)
  "Load a user file interactively
FILE the name of the file to load"
  (interactive "f")
  (load-file (expand-user-file file dir)))

(defun compile-and-load-directory-files (dir)
  (byte-recompile-directory dir)
  (mapc (lambda (file)
          (when (string-match "^\\(.+\.el\\)$" file)
            (let ((compiled (concat file "c")))
              (unless (file-exists-p (expand-user-file compiled dir))
                (byte-compile-file (expand-user-file file dir)))
              (load-user-file compiled dir))))
        (directory-files dir)))

(compile-and-load-directory-files emacs-init-dir)
(compile-and-load-directory-files emacs-lang-dir)
