;; -*- lexical-binding: t; -*-

(setq inhibit-startup-message t
      recentf-max-saved-items 50)

(set-frame-font "CaskaydiaCove Nerd Font 18" nil t)

;; Load the config file
(defun l ()
  (interative)
  (load-file (expand-file-name "init.el" user-emacs-directory)))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-display-line-numbers-mode +1)

(setq custom-file (expand-file-name "custom-settings.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(defconst my/package-archives
  '(("gnu"    . "https://elpa.gnu.org/packages/")
    ("melpa"  . "https://melpa.org/packages/")
    ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
  (require 'package)
  (setq package-archives my/package-archives)     


(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-hard t))

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(use-package eglot
  :ensure t
  :hook ((python-ts-mode . eglot-ensure)
	 (c-ts-mode . eglot-ensure)
	 (c++-ts-mode . eglot-ensure)
	 (ruby-ts-mode . eglot-ensure)
	 (lua-ts-mode . eglot-ensure)
	 (elisp-ts-mode . eglot-ensure)))

(use-package flymake
  :ensure t)

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.0))

(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
	("C-c t t" . treemacs)
	("C-c t b" . treemacs-bookmark)
	("C-c t 1" . treemacs-delete-other-windows))
  :config
  (setq treemacs-collapse-nested-triggers t
	treemacs-width 30
	treemacs-is-never-other-window t)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t))

(use-package magit
  :ensure t)


(use-package password-store
  :ensure t)

(use-package auth-source-pass
  :ensure t
  :config
  (auth-source-pass-enable))


;; fun

(use-package mastodon
  :ensure t
  :bind ("C-c t m" . mastodon)
  :config
  (setq mastodon-instance-url "https://floss.social"
	mastodon-active-user "codeDude"
	auth-source '(password-store)))

(use-package erc
  :ensure t
  :config
  (setq erc-nick "codeDude"
	erc-autojoin-channels-alist '(("Libera.Chat" "#libera" "#neovim" "#archlinux" "#archlinux-mx" "#gnu" "#gnu-mx" "#gnu-es" "#emacs" "#human-emacs" "#emacs-beginners" "#bash" "#javascript" "#typescript" "#reactjs" "#nextjs" "#nodejs" "#ruby" "#rubyonrails" "#python" "#c" "#docker" "#podman" "#kubernetes" "#lobsters")))
  (add-to-list 'erc-modules 'sasl)
  (erc-update-modules)
  (setq erc-sasl-mechanism 'external)

  (defun erc/libera-connect ()
    (interactive)
    (let ((cert (expand-file-name "~/.weechat/certs/libera.pem")))
      (erc-tls :server "irc.libera.chat"
	       :port 6697
	       :nick "codeDude"
	       :client-certificate (list cert cert)))))
