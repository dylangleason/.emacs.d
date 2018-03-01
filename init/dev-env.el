;;;; File: dev-env.el
;;;; helper routines for running processes within a dev environment.

(defun exec-process-cmd (buff-name cmd)
  "Excecute a process cmd and assign it a buffer name.
BUFF-NAME the name of the buffer to assign to the process cmd
CMD the name of the command to execute"
  (comint-send-string (get-buffer-process buff-name) cmd))

(defun change-dir (buff-name dir)
  "Change to directory and assign the supplied buffer name.
BUFF-NAME the name of the buffer to assign
DIR the directory to initialize the buffer in"
  (exec-process-cmd buff-name (format "cd %s\n" dir))
  (exec-process-cmd buff-name "clear\n"))

(defun make-term-buffer (name)
  "Initialize a multi-term buffer with the specified name.
NAME name of the buffer"
  (let* ((buffer (multi-term)) (old-name buffer))
    (with-current-buffer old-name
      (rename-buffer name))))

(defun make-dev-buffer (fn dir orientation)
  "Initialize an interactive development buffer.
FN callback function to execute
DIR directory to start shell session
ORIENTATION location of frame to orient buffer"
  (let ((split-relative-window
         (lambda (direction)
           (let ((new-window (split-window (frame-root-window) nil direction)))
             (save-excursion
               (select-window new-window))
             new-window))))
    (funcall fn)
    (setq default-directory dir)
    (when (not (eq orientation nil))
      (funcall split-relative-window orientation))))

(defun run-process (name dir process-cmd)
  "Run a process in a named buffer after changing the directory.
NAME the name of the buffer to run the process in
DIR the name of the directory to change to
PROCESS-CMD the process command to run in the shell"
  (make-term-buffer name)
  (change-dir name dir)
  (exec-process-cmd name process-cmd))

;;; Example Usage for bootstrapping a local dev environment within
;;; emacs using the above:

;; (defun run-foo-daemon ()
;;   "Run the foo server as a daemon process in it's own buffer"
;;   (run-process "food" foo-dir "./food -p 8080"))

;; (defun make-foo-workspace ()
;;   "Initialize foo-workspace."
;;   (make-term-buffer "foo-workspace")
;;   (change-dir "foo-workspace" "~/projects/foo"))

;; (defun foo-dev ()
;;   (interactive)
;;   (make-dev-buffer 'make-foo-workspace foo-dir nil)
;;   (make-dev-buffer 'run-foo-daemon foo-dir 'left)
;;   (switch-to-buffer foo-workspace))
