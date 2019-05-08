;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(load! "+auth")
(load! "+fira-code")
(load! "+bindings")

;; Theme Config
(require 'doom-themes)
(setq doom-font "Fira Code"
      doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(load-theme 'doom-spacegrey t)

;; Avy Configuration
(def-package! avy
  :config
    (setq avy-all-windows t)
    (setq avy-timeout-seconds 0.4)
    (setq avy-keys '(?t ?n ?s ?e ?r ?i ?a ?o ?g ?k)))

;; LSP Configuration
(def-package! lsp
  :config
    (setq lsp-ui-doc-enable nil) ;; disable docs
    (setq lsp-ui-sideline-enable nil)) ;; disable sideline

;; Color Identifiers
;; (def-package! color-identifiers-mode
;;   :init
;;   (global-color-identifiers-mode))

;; Which Key
(def-package! which-key
  :init
  (setq which-key-idle-delay 0.4))

;; Treemacs config
(def-package! treemacs
  :init
  (setq treemacs-no-png-images t))

;; Org-Mode
(def-package! org
  :init
    (setq-default org-default-notes-file "~/Dropbox/org/tasks.org")
  :config
    (setq org-agenda-files '("~/Dropbox/org")))

;; TODO projectile
(def-package! projectile
  :config
  (add-to-list 'projectile-globally-ignored-directories "engine"))

;; Winum Mode
(def-package! winum
  :after-call (doom-switch-window-hook)
  :config
  (winum-mode +1)
  (setq winum-auto-assign-0-to-minibuffer nil))

;; Spotify
(def-package! counsel-spotify
  :config
  (setq counsel-spotify-client-id wanicode-spotify-id)
  (setq counsel-spotify-client-secret wanicode-spotify-secret))
