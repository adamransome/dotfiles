;;; init.el

;; UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
(global-visual-line-mode t)
(global-linum-mode t)
(setq linum-format "%d ")
(set-face-bold-p 'bold nil)
(toggle-truncate-lines t)

(add-to-list 'default-frame-alist '(font . "Iosevka-13"))
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 90))

;; Custom functions
(setq functions-file "~/.emacs.d/functions.el")
(load functions-file)

;; Scroll one line at a time
(setq scroll-step 1
      scroll-conservatively 10000)

;; Allow resizing for Neotree
(setq neo-window-fixed-size nil)

;; Write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      10 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old

;; Org
(setq org-log-done 'time)
(setq org-agenda-window-setup 'current-window) 
(setq org-agenda-files '("~/workspace/adam-gitlab/work-wiki/tasks.org"))
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "|" "DONE" "WON'T-DO" )))

;; Golang
(defun auto-complete-for-go ()
  (auto-complete-mode 1))
  (add-hook 'go-mode-hook 'auto-complete-for-go)

;; Package management
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Speed up Helm
(setq x-wait-for-event-timeout nil)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Enable tab completion for TTY/Evil
(setq evil-want-C-i-jump nil)

;; Evil 
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(evil-set-initial-state 'term-mode 'emacs)
(evil-set-initial-state 'geben-mode 'emacs)
(evil-set-initial-state 'eshell-mode 'emacs)

;; Yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; Company mode
(use-package company
  :diminish company-mode
  :ensure t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay              0.1
        company-minimum-prefix-length   2
        company-show-numbers            t
        company-tooltip-limit           20
        company-dabbrev-downcase        nil
      )
  )

;; Theme
(use-package doom-themes
  :ensure t)

;; Winner mode
(winner-mode 1)

;; Helm
(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t
  helm-mode-fuzzy-match t
  helm-buffers-fuzzy-matching t
  helm-recentf-fuzzy-match t
  helm-locate-fuzzy-match t
  helm-semantic-fuzzy-match t
  helm-imenu-fuzzy-match t
  helm-completion-in-region-fuzzy-match t
  helm-candidate-number-list 150
  helm-split-window-in-side-p t
  helm-move-to-line-cycle-in-source t
  helm-echo-input-in-header-line t
  helm-autoresize-max-height 0
  helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

;; Magit
(use-package magit
  :ensure t
  :defer t
  :bind (("C-x g" . magit-status))
  :config)

;; Projectile
(use-package projectile
  :ensure t
  :init
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-project-search-path "~/workspace/"))

;; Helm Projectile
(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

;; Emacs Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;; Restclient
(use-package restclient
  :ensure t)

;; Powerline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; Auto package update
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Custom variables
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
