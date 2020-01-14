;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(load! "+auth")
(load! "+fira-code")
(load! "+bindings")

(setq multi-term-program "/usr/local/bin/fish")

;; Theme Config
(setq-default
 doom-theme    'doom-spacegrey
 doom-font     (font-spec :family "Fira Code" :size 18)
 doom-big-font (font-spec :family "Fira Code" :size 23)
 doom-themes-enable-bold t    ; if nil, bold is universally disabled
 doom-themes-enable-italic t) ; if nil, italics is universally disabled

(setq display-line-numbers-type nil)

(defun my/projectile-search-with-hidden ()
  (interactive)
  (let* ((projectile-generic-command
          (concat projectile-generic-command " --no-ignore"))
         (projectile-enable-caching)
         (projectile-git-command projectile-generic-command))
    (call-interactively 'counsel-projectile-find-file)))

;; Avy Configuration
(after! avy
  (setq avy-all-windows t)
  (setq avy-timeout-seconds 0.4)
  (setq avy-keys '(?t ?n ?s ?e ?r ?i ?a ?o ?g ?k)))

;; LSP Configuration
;; (after! lsp
;;   :config
;;   (setq lsp-enable-file-watchers nil))
;; (after! lsp-ui
;;   (setq lsp-ui-doc-enable nil) ;; disable docs
;;   (setq lsp-ui-sideline-enable nil)) ;; disable sideline
(add-hook! 'php-mode-hook
           (setq lsp-enable-file-watchers nil))

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
    (setq org-directory "~/Dropbox/org")
    (setq org-agenda-files '("~/Dropbox/org")))
    (setq +org-capture-todo-file "~/Dropbox/org/todo.org")
    (setq +org-capture-notes-file "~/Dropbox/org/notes.org")
    (setq +org-capture-changelog-file "~/Dropbox/org/changelog.org")

(after! evil-snipe
  (setq evil-snipe-spillover-scope 'visible))

;; TODO projectile
(after! projectile
    (add-to-list 'projectile-globally-ignored-directories "engine"))

;; Winum Mode
(after! winum
  (setq winum-auto-assign-0-to-minibuffer nil))

(add-to-list 'auto-mode-alist '("\\.tpl\\'" . html-mode))
