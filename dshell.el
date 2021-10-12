;;; dshell.el --- a simple package                     -*- lexical-binding: t; -*-

;; Copyright (C) 2021

;; Author: MrX <abc@xyz>
;; Keywords: erl-trace
;; Version: 1.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;; Check `dshell-key-bindings' to know how to use.

(defun dshell-create ()
  (interactive)
  "creates a shell with a given name"
  (let ((shell-num (read-string "shell number: " nil)))
    (shell (concat "*shell-" shell-num "*"))))

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

(defun dshell-key-bindings ()
  (if (equal system-type 'darwin)
      (progn
        (message "Setup switching keys for Darwin.")
        (global-set-key (kbd "C-x 5") 'dshell-split-3-windows-horizontally-evenly)
        (global-set-key (kbd "C-x 6") 'dshell-split-3-windows-vertically-evenly)
        (global-set-key (kbd "C-x 7") 'dshell-create-bash-shell)
        (global-set-key (kbd "C-x 9") 'dshell-create-3)
        (global-set-key [S-left]  'windmove-left)         ; move to left window
        (global-set-key [S-right] 'windmove-right)        ; move to right window
        (global-set-key [S-up]    'windmove-up)           ; move to upper window
        (global-set-key [S-down]  'windmove-down)         ; move to lower window
        (global-set-key [f11] 'dshell-term-toggle-mode)
        (global-set-key [f5] 'spacemacs/revert-buffer-no-confirm))
    nil))

(dshell-key-bindings)

(provide 'dshell)
