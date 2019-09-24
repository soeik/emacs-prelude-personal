;; Load non-prelude modules

;; Yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; Ace jump mode
(add-to-list 'load-path "~/.emacs.d/plugins/ace-jump-mode")
(require 'ace-jump-mode)

;; JS Doc
(add-to-list 'load-path "~/.emacs.d/plugins/js-doc")
(require 'js-doc)

;; Indium
(add-to-list 'load-path "~/.emacs.d/plugins/indium")
(require 'indium)
