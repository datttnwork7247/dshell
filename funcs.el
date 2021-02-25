;;; funcs.el --- Shell Layer functions File
;;
;; Copyright (c) 2012-2017 Dat Nguyen & Contributors
;;
;; Author: Dat Nguyen <datnnt7247@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun dshell-create ()
  (interactive)
  "creates a shell with a given name"
  (let ((shell-name (read-string "shell name: " nil)))
    (shell (concat "*" shell-name "*"))))

(defun dshell-split-3-windows-horizontally-evenly ()
  (interactive)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-horizontally)
  (command-execute 'balance-windows)
  )

(defun dshell-split-3-windows-vertically-evenly ()
  (interactive)
  (command-execute 'split-window-vertically)
  (command-execute 'split-window-vertically)
  (command-execute 'balance-windows)
  )

(defun dshell-delete-3 ()
  (interactive)
  (when (get-buffer "*shell-1*")
    (kill-buffer "*shell-1*"))
  (when (get-buffer "*shell-2*")
    (kill-buffer "*shell-2*"))
  (when (get-buffer "*shell-3*")
    (kill-buffer "*shell-3*"))
  )

(defun dshell-create-3 ()
  (interactive)
  (dshell-delete-3)
  (delete-other-windows)
  (split-window-horizontally)
  (other-window 1)
  (split-window-vertically)
  (other-window 2)

  (shell "*shell-3*")
  (other-window 1)
  (shell "*shell-1*")
  (shell "*shell-2*")
  )

(defun dshell-create-bash-shell ()
  (interactive)
  (when (get-buffer "*bash-shell*")
    (kill-buffer "*bash-shell*"))
  (ansi-term "/bin/bash" "*bash-shell*")
  )

(defun dshell-term-toggle-mode ()
  "Toggles term between line mode and char mode"
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(defun spacemacs/revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))
