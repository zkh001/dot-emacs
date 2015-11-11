;; eldoc
(use-package eldoc)
(use-package eldoc-extension)

;; recentf
(use-package recentf
  :config
  (setq recentf-save-file "~/.emacs.d/.recentf")
  (setq recentf-max-saved-items 2000)

  (setq recentf-exclude '(".recentf"))

  (run-with-idle-timer 120 t 'recentf-save-list)
  
  (use-package recentf-ext))

(use-package google-translate
  :config
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "ja")

  ;; bindings
  (bind-key "C-q C-l" 'google-translate-at-point)         ; en -> ja
  (bind-key "C-q C-n" 'google-translate-at-point-reverse) ; ja -> en
  )

(use-package codic
  :config
  ;; bindings
  (bind-key "C-q C-b" 'codic)
  ;; (bind-key "C-q L" 'codic-translate)
  )

(provide 'tiny-pkgs-init)
