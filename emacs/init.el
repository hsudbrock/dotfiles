;; Disable the tool bar - I don't use it
(tool-bar-mode -1)

;; Disable the menu bar - I don't use it
(menu-bar-mode -1)

;; Disable visual scroll bar
(scroll-bar-mode -1)

;; Visual bell instead of sound
(setq visible-bell t)

;; Enable column numbers in mode line
(column-number-mode)

;; Globally show line numbers in text area
(global-display-line-numbers-mode)

;; Nicer theme
(load-theme 'tango-dark)

;; ESC cancels all
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Setup package management
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Setup use-package
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Setup command log mode (enable with global-command-log-mode)
(use-package command-log-mode)

;; Setup completion framework (ivy + counsel)
(use-package ivy
  :diminish
  :bind (:map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-f" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1))

(use-package counsel)

;; Setup swiper for search
(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

;; Use nicer modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))


;; Add support for markdown, gitlab-ci
(use-package gitlab-ci-mode)
(use-package markdown-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-mode gitlab-ci-mode doom-modeline counsel ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
