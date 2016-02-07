;;;; File: init.el
;;;; Emacs initialization file

(defconst emacs-dir      "~/.emacs.d/")
(defconst emacs-init-dir (concat emacs-dir "init/"))

;; set global variables
(setq lexical-bindings t)                      ; turn on lexical scope
(setq inhibit-startup-message t)               ; get rid of splash screen
(setq case-fold-search nil)                    ; case sensitive search
(setq indent-tabs-mode nil)                    ; turn off tabs
(setq custom-file "~/.emacs.d/init/custom.el") ; dump custom settings in custom.el

;; add elpa directory to load path
(add-to-list 'load-path (concat emacs-dir "elpa/"))

;; set new keybindings
(global-set-key "\C-x\C-m"  'execute-extended-command)  ; M-x
(global-set-key "\C-c\C-m"  'execute-extended-command)  ; M-x
(global-set-key "\C-w"      'backward-kill-word)        ; M-DEL
(global-set-key "\C-x\C-k"  'kill-region)               ; C-k
(global-set-key "\C-c\C-k"  'kill-region)               ; C-k
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key "\C-c\C-c"  'comment-or-uncomment-region)

;; make linum-mode and font-lock mode global
(global-font-lock-mode 1)
(global-linum-mode 1)

;; Turn off scroll bars and menus
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 20
      kept-old-versions 10)

;; init package manager
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; load files in init directory
(defun load-user-file (file)
  (interactive "f")
  (load-file (expand-file-name file emacs-init-dir)))

(mapc (lambda (elt)
        (if (string-match "^\\(.+\.el\\)$" elt)
            (load-user-file elt)))
      (directory-files emacs-init-dir))
