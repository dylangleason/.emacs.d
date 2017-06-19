;;;; File: init.el
;;;; Emacs initialization file

(defconst emacs-dir "~/.emacs.d/")
(defconst emacs-init-dir (concat emacs-dir "init/"))

;; set global variables
(setq lexical-bindings t
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

;; set new keybindings
(global-set-key "\C-x\C-m" 'execute-extended-command)  ; M-x
(global-set-key "\C-c\C-m" 'execute-extended-command)  ; M-x
(global-set-key "\C-w" 'backward-kill-word)            ; M-DEL
(global-set-key "\C-x\C-k" 'kill-region)               ; C-k
(global-set-key "\C-c\C-k" 'kill-region)               ; C-k
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)

;; make font-lock mode global
(global-font-lock-mode 1)

;; Turn off scroll bars and menus
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; init package manager
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(package-initialize)

(defun packages-require (&rest packages)
  "Install and load one or more packages automatically"
  (mapc (lambda (package)
          (unless (package-installed-p package)
            (package-install package))
          (require package))
        packages))

(packages-require
 'exec-path-from-shell
 'flycheck)

;; load files in init directory
(defun load-user-file (file)
  (interactive "f")
  (load-file (expand-file-name file emacs-init-dir)))

(mapc (lambda (file)
        (when (string-match "^\\(.+\.el\\)$" file)
          (load-user-file file)))
      (directory-files emacs-init-dir))

(add-to-list 'load-path "~/Projects/standup-notes")
(require 'standup-notes)
