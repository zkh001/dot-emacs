(use-package neotree
  :config

  ;; when open neotree, show the current dir
  (setq neo-smart-open t)
  ;; simple keymap
  (setq neo-keymap-style 'concise)

  (setq neo-persist-show nil)

  ;; helmで無効にする
  (add-to-list 'helm-completing-read-handlers-alist '(neotree-rename-node . nil))
  (add-to-list 'helm-completing-read-handlers-alist '(neotree-create-node . nil))
  (add-to-list 'helm-completing-read-handlers-alist '(neotree-copy-node   . nil))


  (when (popwin-mode)
    (when neo-persist-show
      (add-hook 'popwin:before-popup-hook
                (lambda () (setq neo-persist-show nil)))
      (add-hook 'popwin:after-popup-hook
                (lambda () (setq neo-persist-show t)))))

  ;;
  ;; binding
  ;;
  (unbind-key "C-n" neotree-mode-map)
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
  )

(provide 'directory-init)
