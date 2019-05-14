;;; ~/dotfiles/.doom.d/+spotify.el -*- lexical-binding: t; -*-

;; Spotify
(def-package! counsel-spotify
  :config
    (setq counsel-spotify-client-id wanicode-spotify-id)
    (setq counsel-spotify-client-secret wanicode-spotify-secret))

(map!
 (:leader :prefix ("a" . "applications")
   (:after counsel-spotify
    (:prefix ("s" . "spotify")
      :desc "Search Artist" "A" #'counsel-spotify-search-artist
      :desc "Search Album" "a" #'counsel-spotify-search-album
      :desc "Next Track" "n" #'counsel-spotify-next
      :desc "Previous Track" "p" #'counsel-spotify-previous
      :desc "Play / Pause Song" "s" #'counsel-spotify-toggle-play-pause
      :desc "Search Track" "t" #'counsel-spotify-search-track))))
