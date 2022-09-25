(eval-when-compile
  (defun eshell/clear (&optional scrollback) '())
  (defun eshell-kill-input () '())
  (defun eshell-send-input (&optional use-region queue-p no-newline) '()))

;; see https://emacs.stackexchange.com/questions/12503/how-to-clear-the-eshell
(defun run-this-in-eshell (cmd)
  "Run CMD in eshell."
  (with-current-buffer (buffer-name (current-buffer))
    (eshell-kill-input)
    (goto-char (point-max))
    (insert cmd)
    (eshell-send-input)
    (goto-char (point-max))
    (yank)))

(defun my-eshell-mode-hook ()
  (local-set-key
   (kbd "C-l")
   (lambda ()
     (interactive)
     (run-this-in-eshell "clear 1")))
  (paredit-mode t))

(use-package eshell
  :ensure nil
  :hook (eshell-mode . my-eshell-mode-hook))

(use-package eshell-git-prompt
  :demand t
  :after (eshell)
  :config (eshell-git-prompt-use-theme 'robbyrussell))

(provide 'init-eshell)
