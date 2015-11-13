(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(use-package yatex
  :init
  (add-to-list 'auto-mode-alist '("\\.tex$" . yatex-mode))
)

(provide 'tex-init)
