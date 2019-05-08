;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(setq doom-localleader-key ",")

(map!
 (:leader :prefix ("a" . "applications")
   (:after counsel-spotify
    (:prefix ("s" . "spotify")
      :desc "Search Artist" "A" #'counsel-spotify-search-artist
      :desc "Search Album" "a" #'counsel-spotify-search-album
      :desc "Next Track" "n" #'counsel-spotify-next
      :desc "Previous Track" "p" #'counsel-spotify-previous
      :desc "Play / Pause Song" "s" #'counsel-spotify-toggle-play-pause
      :desc "Search Track" "t" #'counsel-spotify-search-track)))

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
    [down] #'evil-window-down
    )))
