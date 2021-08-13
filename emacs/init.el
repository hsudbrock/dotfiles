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

;; Configure magit
(use-package magit
  :bind ("C-M-;" . magit-status)
  :commands (magit-status magit-get-current-branch))

;; Add support for dragging stuff
(use-package drag-stuff
  :ensure t
  :init (drag-stuff-global-mode t)
  :bind (
	 ("M-<up>" . drag-stuff-up)
	 ("M-<down>" . drag-stuff-down)
  )
)
