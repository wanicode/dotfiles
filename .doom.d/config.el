;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(load! "+auth")
(load! "+fira-code")
(load! "+bindings")

;; Theme Config
(setq-default
 doom-theme    'doom-spacegrey
 doom-font     (font-spec :family "Fira Code" :size 12)
 doom-big-font (font-spec :family "Fira Code" :size 18)
 doom-themes-enable-bold t    ; if nil, bold is universally disabled
 doom-themes-enable-italic t) ; if nil, italics is universally disabled

(setq display-line-numbers-type nil)

;; Avy Configuration
(after! avy
  (setq avy-all-windows t)
  (setq avy-timeout-seconds 0.4)
  (setq avy-keys '(?t ?n ?s ?e ?r ?i ?a ?o ?g ?k)))

;; LSP Configuration
(after! lsp-ui
  (setq lsp-ui-doc-enable nil) ;; disable docs
  (setq lsp-ui-sideline-enable nil)) ;; disable sideline

;; Color Identifiers
;; (def-package! color-identifiers-mode
;;   :init
;;   (global-color-identifiers-mode))

;; Which Key
(after! which-key
  (setq which-key-idle-delay 0.4))

;; Treemacs config
(after! treemacs
  (setq treemacs-position 'right)
  (setq treemacs-no-png-images t))

;; Org-Mode
(after! org
    (setq-default org-default-notes-file "~/Dropbox/org/tasks.org")
    (setq org-agenda-files '("~/Dropbox/org")))

;; TODO projectile
(after! projectile
    (add-to-list 'projectile-globally-ignored-directories "engine"))

;; Winum Mode
(def-package! winum
  :after-call (doom-switch-window-hook)
  :config
  (winum-mode +1)
  (setq winum-auto-assign-0-to-minibuffer nil))

;; Spotify
(after! counsel-spotify
  (setq counsel-spotify-client-id wanicode-spotify-id)
  (setq counsel-spotify-client-secret wanicode-spotify-secret))
