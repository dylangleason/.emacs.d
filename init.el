;;;; File: init.el
;;;; Emacs initialization file

(defconst emacs-dir       "~/.emacs.d/")
(defconst emacs-init-dir  (concat emacs-dir "init/"))

;; set load path
(add-to-list 'load-path (concat emacs-dir "elpa/"))
(add-to-list 'load-path (concat emacs-dir "site-lisp/"))
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

;; set new keybindings
(global-set-key "\C-x\C-m"  'execute-extended-command)  ; M-x
(global-set-key "\C-c\C-m"  'execute-extended-command)  ; M-x
(global-set-key "\C-w"      'backward-kill-word)        ; M-DEL
(global-set-key "\C-x\C-k"  'kill-region)               ; C-k
(global-set-key "\C-c\C-k"  'kill-region)               ; C-k
(global-set-key (kbd "RET") 'newline-and-indent)

;; make linum-mode and font-lock mode global
(global-font-lock-mode 1)
(global-linum-mode 1)

;; Turn off scroll bars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(setq inhibit-startup-message t)               ; get rid of splash screen
(setq case-fold-search nil)                    ; case sensitive search
(setq-default indent-tabs-mode nil)            ; turn off tabs
(setq custom-file "~/.emacs.d/init/custom.el") ; dump custom settings in a file

;; backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 10
      kept-old-versions 5)

;; paredit for elisp editing
(autoload 'paredit-mode "paredit" t)
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode t)))

;; setup package manager
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; set shell path when using emacs.app
(when (memq window-system '(mac ns))
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-initialize))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file emacs-init-dir)))

;; load emacs init dir files
(mapc (lambda (elt)
        (if (string-match "^\\(.+\.el\\)$" elt)
            (load-user-file elt)))
      (directory-files emacs-init-dir))
