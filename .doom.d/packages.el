;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

;; Color Identifiers Mode
;; (package! color-identifiers-mode)

(package! counsel-spotify)
(package! pandoc-mode)

(eval-after-load "org"
  '(require 'ox-odt nil t))
