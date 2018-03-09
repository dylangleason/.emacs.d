;;;; File: c-cpp-java.el
;;;; emacs settings for c, cpp and java editing

(defun my-c-mode-common-hook ()
  (setq c-basic-offset 4 indent-tabs-mode nil)
  (c-set-offset 'case-label '+)
  (set (make-local-variable 'compile-command) "make"))

(defun my-c++-mode-hook ()
  (c-set-style "stroustrup")
  (my-c-mode-common-hook))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
