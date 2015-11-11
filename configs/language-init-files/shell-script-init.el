
(use-package sh-script
  :init
  (add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
  :config
  (add-hook 'sh-mode-hook
            '(lambda ()
               (if (string-match "\\.zsh$" buffer-file-name)
                   (sh-set-shell "zsh"))))
  )

(provide 'shell-script-init)
