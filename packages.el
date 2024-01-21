;;Package repo
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(use-package evil
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo))

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

(use-package ivy
  :config
  (ivy-mode 1))

(use-package lua-mode)

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-enable-key-bindings nil)
  (setq centaur-tabs-modified-marker "*")
  (setq centaur-tabs-set-icons t)
  (centaur-tabs-headline-match)
  (setq centaur-tabs-style "bar"))


(use-package all-the-icons)

