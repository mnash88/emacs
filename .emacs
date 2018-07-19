;; Set default projectile location
;;(use-package projectile :ensure t
;;  :config ((projectile-mode)
;;                (setq projectile-project-search-path '("~/projects/")))
;;  )
;; Hide startup screen, toolbar, menubar, scrollbar, and fullscreen emacs by default
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(show-paren-mode)
(setq-default indent-tabs-mode nil)
(global-linum-mode 1)
(server-start)
;; programatically install use-package if it isn't already installed
;; add melpa, marmalade, gnu package repositories
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(use-package spacemacs-common
  :ensure spacemacs-theme
  :config (load-theme 'spacemacs-dark t))
(use-package helm :ensure t
             :bind (("M-x" . helm-M-x)
                    ("C-x C-f" . helm-find-files)
                    ("C-x b" . helm-buffers-list))
             )
(use-package which-key :ensure t
  :config (which-key-mode)
  )
(use-package hlinum :ensure t
             :config (hlinum-activate))
(use-package restclient :ensure t)
(use-package neotree :ensure t
             :bind ([f8] . neotree-toggle)
             :init (setq neo-window-width 30)
             :config (setq projectile-switch-project-action 'neotree-projectile-action))
(use-package projectile :ensure t
             :config (projectile-mode)
             )
(use-package erlang :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (erlang which-key spacemacs-theme projectile neotree restclient hlinum helm zenburn-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
