;; Custom key bindings

;; Imenu
(global-set-key (kbd "C-x M-i") 'imenu)

;; AceJump
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Multiple cursors key bindings
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-x C->") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;(define-key mc/keymap (kbd "<return>") nil)

;; Tide hot keys
(global-set-key (kbd "C-x t f") 'tide-fix)
(global-set-key (kbd "C-x t r") 'tide-rename-symbol)
(global-set-key (kbd "C-x t R") 'tide-rename-file)
(global-set-key (kbd "C-x t l") 'tide-rename-symbol-at-location)
