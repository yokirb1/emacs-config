;;Org mode configuration
(require 'org)

;;org files dir
(setq org-directory "~/life_os")

;;cleaner outline view
(add-hook 'org-mode-hook 'org-indent-mode)

;;TODO keywords
(setq org-todo-keywords
	  '((sequence "TODO(t)" "WORKING(w)" "WAITING(p)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-use-fast-todo-selection 'expert)

;;Faces
(setq org-todo-keyword-faces
	  '(("TODO" . org-warning) ("WORKING" . (:foreground "orange" :weight bold)) ("CANCELLED" . (:foreground "red" :weight bold))))

;;Do not check a headline as DONE unless its children are done too
(setq org-enforce-todo-dependencies 1)
(setq org-enforce-todo-checkbox-dependencies 1)

;;Tag indent
(setq org-tags-column 0)

;;Timestamp when marked as DONE
(setq org-log-done 'time)

;;Spawn a sparse-tree matching only what is yet to be done
(defun org-todo-sparse-tree ()
  (interactive)
  (clone-indirect-buffer (format "%s.TODO" (file-name-base (buffer-name))) t)
  (org-show-todo-tree nil))

;;Default tag-list
(setq org-tag-persistent-alist '(("@homework" . ?h) ("@assignment" . ?a)))

;;Capture settings
(defun get-capture-template () "* %? %T %f")
(setq org-default-notes-file (concat org-directory "/refile.org"))
(setq org-capture-templates
    '(("t" "Everything academic-wise, i.e, school, PDV, math" entry (file+headline "" "Academic")
    (function get-capture-template) :empty-lines-after 1)
    ("c" "Computer-science catch-all" entry (file+headline "" "Computer Science")
    (function get-capture-template) :empty-lines-after 1)
    ("a" "Appointments and whatnot" entry (file+headline "" "Appointments")
    (function get-capture-template) :empty-lines-after 1)
    ("m" "Miscellaneous, does not fit within the previous labelers" entry (file+headline "" "Miscellaneous")
    (function get-capture-template) :empty-lines-after 1)))

;;Refile settings
(setq org-refile-use-outline-path 'file
    org-outline-path-complete-in-steps nil)

(setq org-refile-targets `(
    (,(directory-files-recursively org-directory "[a-zA-Z_-]*\.org$") :maxlevel . 5)))
