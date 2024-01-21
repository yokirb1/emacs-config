;;<l>zz save file
;;<l>k next buffer
;;<l>j previous buffer 
;;<l>b :<name>: switch to buffer named <name>
;;C-Backspace delete just one damn word
;;note: window keybinds

;;org
;;<l>c cycle working states
;;<l>> subset
;;<l>< superset

;;Custom keymap
(setq custom-keybinds '(
						"f s" save-buffer
						"f f" find-file
						"C-r" (lambda () (interactive) (load-file user-init-file))
						"k" centaur-tabs-forward
						"j" centaur-tabs-backward
						"b" switch-to-buffer
						))

;;Org custom keymap
(setq org-keybinds '(
					 "C-j" org-do-promote
					 "C-k" org-do-demote
					 ;;"C-k" org-promote-subtree ;;these must depend on org-do-promote but with a prefix C-u argument
					 ;;"C->" org-demote-subtree
					 "s" org-todo
					 "t" org-set-tags-command 
                     "r" org-refile
                     "c" org-capture
					 ))

(setq window-keybinds '(
						"h" split-window-right
						"v" split-window-below))

;;Keymaps to include
(setq include-keybinds '(
						 custom-keybinds
						 org-keybinds
						 window-keybinds))


;(defun add_custommap (binds prefix mode)
;  "Binds PREFIX to a keymap made of BINDS whenever MODE's keymap is active"
;  (keymap-set mode prefix (apply 'define-keymap binds)))

;(add_custommap custom-keybinds "SPC" evil-normal-state-map)
;(add_custommap org-keybinds "SPC" org-mode-map)

;;Keys mode
(defvar mykeys-mode nil "Minor mode meant to take precedence over all active keymaps")
(defun mykeys-mode (&optional arg)
  (interactive (list 'toggle))
  (setq mykeys-mode
		(if (eq arg 'toggle)
			(not mykeys-mode)
		  (> arg 0)))
  (if mykeys-mode
	  (message "Leader key enabled")
	(message "Leader key disabled")))

(unless (assq 'mykeys-mode minor-mode-alist)
  (push '(mykeys-mode " Keys") minor-mode-alist))

;;;Set mykeys-mode's keymap
(setq mykeys-mode-map (apply 'define-keymap (eval `(append ,@include-keybinds))))
(keymap-set evil-normal-state-map "SPC" mykeys-mode-map)
;(add-to-list 'minor-mode-map-alist (cons 'mykeys-mode (define-keymap "SPC" mykeys-mode-map)))

