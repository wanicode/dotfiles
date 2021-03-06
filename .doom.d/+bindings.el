;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")

(map!
 (:leader
  (:prefix "s" "h" #'my/projectile-search-with-hidden))

 (:leader "m" #'evil-multiedit-match-all)
 (:after evil-multiedit
  (:map evil-multiedit-state-map
   "n" #'evil-multiedit-next
   "N" #'evil-multiedit-prev
   "v" #'iedit-show/hide-unmatched-lines))

 (:after evil
  (:leader
   "0" #'treemacs-select-window
   "1" #'winum-select-window-1
   "2" #'winum-select-window-2
   "3" #'winum-select-window-3
   "4" #'winum-select-window-4
   "5" #'winum-select-window-5
   "6" #'winum-select-window-6
   "7" #'winum-select-window-7
   "8" #'winum-select-window-8
   "9" #'winum-select-window-9
   [left] #'evil-window-left
   [right] #'evil-window-right
   [up] #'evil-window-up
   [down] #'evil-window-down)
  (:map evil-window-map
   "0" #'treemacs-select-window
   [left] #'evil-window-left
   [right] #'evil-window-right
   [up] #'evil-window-up
   [down] #'evil-window-down)))
