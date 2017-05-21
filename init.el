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

;; load files in init directory
(defun load-user-file (file)
  (interactive "f")
  (load-file (expand-file-name file emacs-init-dir)))

(load-user-file "package.el")

(mapc (lambda (file)
        (when (and (string-match "^\\(.+\.el\\)$" file)
                   (not (equal "package.el" file)))
          (load-user-file file)))
      (directory-files emacs-init-dir))

(require 'flycheck)
