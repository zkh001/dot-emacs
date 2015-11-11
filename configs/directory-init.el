
(use-package neotree
  :config

  ;; when open neotree, show the current dir
  (setq neo-smart-open t)
  ;; simple keymap
  (setq neo-keymap-style 'concise)

  (setq neo-persist-show nil)


  (when (popwin-mode)
    (when neo-persist-show
      (add-hook 'popwin:before-popup-hook
                (lambda () (setq neo-persist-show nil)))
      (add-hook 'popwin:after-popup-hook
                (lambda () (setq neo-persist-show t)))))

  ;;
  ;; binding
  ;;
  (bind-key "<f7>" 'neotree-toggle)
  (bind-keys :map neotree-mode-map
             ("j" . neotree-next-line)
             ("k" . neotree-previous-line)
             ("r" . neotree-refresh)
             ("c" . neotree-create-node)
             ("C" . neotree-copy-node)
             ("D" . neotree-delete-node)
             ("R" . neotree-rename-node)
             ("Q" . neotree-change-root)
             ("M" . neotree-stretch-toggle))
  
  (bind-key "j" 'neotree-next-line     neotree-mode-map)
  (bind-key "k" 'neotree-previous-line neotree-mode-map)
  (bind-key "r" 'neotree-refresh       neotree-mode-map)
  (bind-key "C" 'neotree-create-node neotree-mode-map)
  (bind-key "D" 'neotree-delete-node neotree-mode-map)
  (bind-key "R" 'neotree-rename-node neotree-mode-map)
  (bind-key "Q" 'neotree-change-root neotree-mode-map)
  (bind-key "M" 'neotree-stretch-toggle neotree-mode-map)

  )

(provide 'directory-init)
