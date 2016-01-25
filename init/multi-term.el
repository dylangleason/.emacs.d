;;;; File: multi-term.el
;;;; multi-term customizations

(require 'multi-term)
(setq multi-term-program "/bin/zsh")

(defconst project-dir (expand-file-name "~/Documents/Projects"))

(defun exec-process-cmd (buffer-name cmd)
  (comint-send-string (get-buffer-process buffer-name) cmd))

(defun change-dir (buff-name dir)
  (progn
    (exec-process-cmd buff-name (format "cd %s\n" dir))
    (exec-process-cmd buff-name "clear\n")))

(defun init-buffer (name)
  (let* ((buffer (multi-term)) (old-name buffer))
    (with-current-buffer old-name
      (rename-buffer name))))

(defun split-relative-window (direction)
  (let ((new-window (split-window (frame-root-window) nil direction)))
    (save-excursion
      (select-window new-window))
    new-window))

(defun init-harebraneserver ()
  (let* ((name "harebraneserver")
         (dir  (concat project-dir "/harebrane/src/" name)))
    (init-buffer name)
    (change-dir name dir)
    (exec-process-cmd name "hb\n")
    (split-relative-window nil)))

(defun init-zisa ()
  (let* ((name "zisa")
         (dir  (concat project-dir "/" name "/")))
    (init-buffer name)
    (change-dir name dir)
    (exec-process-cmd name "gulp\n")
    (split-relative-window 'left)))

(defun init-harebranetest ()
  (let* ((name "harebranetest")
         (dir  (concat project-dir "/harebrane/src/")))
    (init-buffer name)
    (change-dir name dir)))

(defun init-axis-buffers ()
  (interactive)
  (init-harebraneserver)
  (init-zisa)
  (init-harebranetest))

;; set keybindings for multiterm actions
(global-set-key "\C-ct" 'multi-term)
(global-set-key "\M-["  'multi-term-prev)
(global-set-key "\M-]"  'multi-term-next)
(global-set-key "\C-ca" 'init-axis-buffers)
