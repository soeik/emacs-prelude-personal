(require 'subr-x)

;;; Code:

;; Set default theme
(setq prelude-theme 'moe-dark)

;; Set font
(add-to-list 'default-frame-alist '(font . "Source Code Pro Light" ))

;; Set font size
(set-face-attribute 'default nil :height 120)

;; Maximize on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Add some fancy transparency
(set-frame-parameter (selected-frame) 'alpha '(100 .  90))
(add-to-list 'default-frame-alist '(alpha . (100 . 90)))

(provide 'preload)

;;; preload.el ends here
p
