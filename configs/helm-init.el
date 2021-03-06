
(use-package helm
  :config
  (use-package helm-config)
  (helm-mode 1)

  ;; 使用頻度順にソートされるように
  (helm-adaptive-mode t)

  (add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
  (add-to-list 'helm-completing-read-handlers-alist '(write-file . nil))
  
  ;;;
  ;;; binding
  ;;;
  (bind-key "C-x C-r" 'helm-recentf)
  (bind-key "C-x C-b" 'helm-buffers-list)
  (bind-key "M-y"     'helm-show-kill-ring)

  (bind-keys :map helm-read-file-map
             ("<tab>" . helm-execute-persistent-action)
             ("C-z"   . helm-select-action))

  (bind-keys :prefix-map helm-prefix
             :prefix "C-q C-h"
             ("C-r" . helm-recentf)
             ("C-f" . helm-find-files)
             ("C-y" . helm-show-kill-ring)
             ("C-c" . helm-colors)
             ("C-m" . helm-man-woman))
  )


(provide 'helm-init)
