(require 'subr-x)

;; Set default theme
(setq prelude-theme 'mysterioso)

;; Set font size
(set-face-attribute 'default nil :height 140)

;; Maximize on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Add some fancy transparency
(set-frame-parameter (selected-frame) 'alpha '(95 .  95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))
