;;;; File: c-cpp-java.el
;;;; emacs settings for c, cpp and java editing

(defun my-c-mode-common-hook ()
  (c-set-style "bsd")
  (c-toggle-auto-newline 1)
  (setq c-basic-offset 4 indent-tabs-mode nil)
  (c-set-offset 'case-label '+)
  (set (make-local-variable 'compile-command) "make"))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
