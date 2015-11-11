
(provide 'flycheck-init)

(use-package flycheck
  :config
  (use-package flycheck-pos-tip
    :config
    (eval-after-load 'flycheck
      '(custom-set-variables '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
    )

  (add-hook 'after-init-hook #'global-flycheck-mode)
  )
