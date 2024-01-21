;; Emacs configuration

;;Splash-screen
(setq inhibit-startup-message t)

;;Backup files
(setq backup-directory-alist '(("." . "~/.config/emacs/saves")))

;;Disable some UI elements
(when (display-graphic-p)
  (progn
    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)))

;;Line numbers
(global-display-line-numbers-mode 1)

;;Theme
(load-theme 'gruvbox t)

;;No UI dialogs
(setq use-dialog-box nil)

;;Tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-basic-offset 4)

;;Revert buffers if altered
(global-auto-revert-mode 1)

;;Do not truncate lines at window boundaries
(toggle-truncate-lines -1)
(setq truncate-partial-width-windows 150)

;Remember point for each file
(save-place-mode 1)

;;Scrolling
(setq-default scroll-margin 7)
(setq-default mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq-default mouse-wheel-progressive-speed nil)
(setq-default mouse-wheel-follow-mouse 't)
(setq-default scroll-step 1)

;;Load external files
(defun iload (file)
  (load (locate-user-emacs-file file)) 'noerror 'nomessage)

(setq files '("org.el" "packages.el" "keys.el"))
(mapc #'iload files)

;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-evars.el"))
(iload custom-file)
