;;; -*- lexical-binding: t -*-

;; temporarily set `gc-cons-threshold' to improve startup

(let ((tmp gc-cons-threshold))
  (setq gc-cons-threshold (* 20 1024 1024))
  (add-hook 'emacs-startup-hook (lambda () (setq gc-cons-threshold tmp))))

;; disable GUI elements

(menu-bar-mode -1)

(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

(setq inhibit-startup-message t)
