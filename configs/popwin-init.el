
(use-package popwin
  :config
  (popwin-mode 1)

  (setq display-buffer-function 'popwin:display-buffer)
  (setq popwin:popup-window-height 0.4)

  ;; ポップするやつを追加
  (push '("*Google Translate*") popwin:special-display-config)
  (push '("*Codic Result*") popwin:special-display-config)
  )

(provide 'popwin-init)
