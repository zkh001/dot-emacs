
(use-package org
  :config
  (add-hook 'org-mode-hook
            '(lambda ()
               (setq org-html-validation-link nil)
               ))

  ;;
  ;; bindings
  ;;
  (bind-keys :map org-mode-map
             :prefix-map my-org-mode-prefix
             :prefix "C-q C-o"
             ("C-e" . org-export-dispatch)
             )

  (bind-keys :map org-mode-map
             :prefix-map my-org-table-prefix
             :prefix "C-q C-o C-t"
             ("i" . org-table-insert-row)    ;行
             ("I" . org-table-insert-column) ;列
             ("-" . org-table-insert-hline)  ;横線
             )
  )

(provide 'org-init)
