;;;; File: init.el
;;;; Emacs initialization file

;;; Helper constants and functions

(defconst emacs-dir "~/.emacs.d/")
(defconst emacs-init-dir (concat emacs-dir "init/"))

(defun kill-other-buffers ()
  "Kill all buffers except the current buffer"
  (interactive)
  (let ((cur (current-buffer)))
    (dolist (buf (buffer-list))
      (unless (string= (buffer-name buf) (buffer-name cur))
        (kill-buffer buf)))))

(defun packages-require (&rest packages)
  "Install and load one or more packages automatically"
  (mapc (lambda (package)
          (unless (package-installed-p package)
            (package-install package))
          (require package))
        packages))

(defun expand-user-file (file)
  "Expand the user file name
FILE the name of the file to expand"
  (expand-file-name file emacs-init-dir))

(defun load-user-file (file)
  "Load a user file interactively
FILE the name of the file to load"
  (interactive "f")
  (load-file (expand-user-file file)))

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
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(packages-require
 'exec-path-from-shell
 'flycheck)

;; compile files for quicker loading
(byte-recompile-directory emacs-init-dir)

;; load files in the init directory
(mapc (lambda (file)
        (when (string-match "^\\(.+\.el\\)$" file)
          (let ((compiled (concat file "c")))
            (if (file-exists-p (expand-user-file compiled))
                (load-user-file compiled)
              (progn
                (byte-compile-file (expand-user-file file))
                (load-user-file compiled))))))
      (directory-files emacs-init-dir))
