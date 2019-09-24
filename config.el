;; Set indexing method to native
(when (eq system-type 'windows-nt)
  (setq projectile-indexing-method 'native))

;; Disable jshint for flycheck to supress warning and errors.
;; Workaround to make flycheck use local .eslintrc
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)
                      '(javascript-eslint)
                      '(json-jsonlist)))

;; use eslint with web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)


;; Turn off js2 mode errors & warnings (we lean on eslint/standard)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

(setq-default flycheck-temp-prefix ".")
(setq flycheck-eslintrc "~/.eslintrc")


;; Prettier
(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))

(add-hook 'web-mode-hook
          #'(lambda () (enable-minor-mode '("\\.jsx?\\'" . prettier-js-mode))))

(eval-after-load 'web-mode
  '(progn
     (add-hook 'js2-mode-hook #'prettier-js-mode)
     (add-hook 'web-mode-hook #'prettier-js-mode)
     (add-hook 'typescript-mode-hook #'prettier-js-mode)
     ))


;; Typescript and TSX support
(add-to-list 'auto-mode-alist '("\.ts\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\.tsx\'" . typescript-mode))
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; JSX mode
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'typescript-mode)
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; Dired do what i mean
(setq dired-dwim-target t)

;; Disable themes on load
(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))
