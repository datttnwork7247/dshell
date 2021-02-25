;; -----------------------------------------------------------------------------
;; Hotkeys
;; -----------------------------------------------------------------------------
(defun is-darwin ()
  (if (equal system-type 'darwin)
      t nil)
  )

(defun key-bindings ()
  (global-set-key (kbd "C-x 5") 'dshell-split-3-windows-horizontally-evenly)
  (global-set-key (kbd "C-x 6") 'dshell-split-3-windows-vertically-evenly)
  (global-set-key (kbd "C-x 7") 'dshell-create-bash-shell)
  (global-set-key (kbd "C-x 9") 'dshell-create-3)

  ;; Use Cmd - 1 | 2 | 3 | 4 instead
  (global-set-key [S-left]  'windmove-left)         ; move to left window
  (global-set-key [S-right] 'windmove-right)        ; move to right window
  (global-set-key [S-up]    'windmove-up)           ; move to upper window
  (global-set-key [S-down]  'windmove-down)         ; move to lower window

  (global-set-key [f11] 'dshell-term-toggle-mode)
  (global-set-key [f5] 'spacemacs/revert-buffer-no-confirm)
  (cond ((equal system-type 'darwin)
         (message "Setup switching keys for Darwin.")
         (setq mac-command-modifier 'meta) ; set alt-key to meta
         (setq mac-option-modifier  'nil))
        (t ""))
  )
(key-bindings)
