;; eldoc
(use-package eldoc)
(use-package eldoc-extension)

;; comment-dwin-2
(use-package comment-dwim-2
  :config
  (bind-key "C-M-;" 'comment-dwim-2))

;; smartrep
(use-package smartrep
  :config
  ;; ウィンドウのリサイズ操作

  (define-prefix-command 'window-prefix)
  (bind-key "C-\\" 'window-prefix)

  (smartrep-define-key global-map "C-\\"
    '(("h" . shrink-window-horizontally)
      ("j" . enlarge-window)
      ("k" . shrink-window)
      ("l" . enlarge-window-horizontally)
      ("+" . balance-windows)))
  )

;; duplicate-thing
(use-package duplicate-thing
  :config
  (bind-key "M-c" 'duplicate-thing)
  )

;; undo-tree
(use-package undo-tree
  :config
  (global-undo-tree-mode)

  ;;
  ;; binding
  ;;
  (bind-keys :map undo-tree-visualizer-mode-map
	     ("j" . undo-tree-visualize-redo)
	     ("k" . undo-tree-visualize-undo)
	     ("h" . undo-tree-visualize-switch-branch-left)
	     ("l" . undo-tree-visualize-switch-branch-right))

  ;; global
  (bind-key "C-z" 'undo-tree-undo)
  (bind-key "C-M-z" 'undo-tree-redo)
  )

;; multiple-cursors
(use-package multiple-cursors
  :config

  ;;
  ;; binding
  ;;
  (bind-keys :prefix-map multiple-cursors-prefix
             :prefix "C-q C-SPC"
             ( "C-j" . mc/mark-next-like-this)
             ( "C-k" . mc/mark-previous-like-this)
             ( "C-m" . mc/mark-all-dwim)
             ( "C-a" . mc/edit-beginnings-of-lines)
             ( "C-e" . mc/edit-ends-of-lines)
             ( "C-x" . mc/mark-more-like-this)
             ( "C-s" . mc/mark-all-symbols-like-this)
             )

  ;; smartrep
  (smartrep-define-key global-map "C-q C-SPC"
    '(("C-j" . mc/mark-next-like-this)
      ("C-k" . mc/mark-previous-like-this)))      
  )

;; recentf
(use-package recentf
  :config
  (setq recentf-save-file "~/.emacs.d/.recentf")
  (setq recentf-max-saved-items 2000)

  (setq recentf-exclude '(".recentf"))

  (run-with-idle-timer 120 t 'recentf-save-list)
  
  (use-package recentf-ext))

;; google-translate interface
(use-package google-translate
  :config
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "ja")

  ;; bindings
  (bind-key "C-q C-l" 'google-translate-at-point)         ; en -> ja
  (bind-key "C-q C-n" 'google-translate-at-point-reverse) ; ja -> en
  )

;; codic interface
(use-package codic
  :config
  ;; bindings
  (bind-key "C-q C-b" 'codic)
  ;; (bind-key "C-q L" 'codic-translate)
  )

;; smart-newline
(use-package smart-newline)

;; yasnippet
(use-package yasnippet
  :config
  (eval-when-compile (use-package f))
  (when (f-exists? "~/.emacs.d/snippets/yasmate")
    (setq yas-snippet-dirs '("~/.emacs.d/snippets" "~/.emacs.d/snippets/yasmate" yas-installed-snippets-dir)))
  (yas-global-mode 1)
  )

(provide 'tiny-pkgs-init)
