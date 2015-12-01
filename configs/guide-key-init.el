
(use-package guide-key
  :if (popwin-mode)

  :config

  ;; (setq guide-key/guide-key-sequence '("C-q" "M-p" "C-c" "M-g" "<f1>" "C-c h"))
  ;; all bindings is shown
  (setq guide-key/guide-key-sequence t)

  ;; 再帰的に"Prefix Command"のシーケンスも表示する設定
  (setq guide-key/recursive-key-sequence-flag t)

  (setq guide-key/idle-delay 1.0)

  ;; 文字の大きさを変更する
  (setq guide-key/text-scale-amount -4)

  (setq guide-key/popup-window-position 'right)
  ;; (setq guide-key/popup-window-position 'bottom)

  (guide-key-mode 1)

  (when window-system                   ; not on terminal
    ;; poptipで表示させる
    (use-package guide-key-tip
      :config
      (setq guide-key-tip/enabled t)

      (set-face-foreground 'guide-key-tip/pos-tip-face "black")
      (set-face-background 'guide-key-tip/pos-tip-face "light cyan")
      (set-face-bold 'guide-key-tip/pos-tip-face nil))
    ;; MEMO(右下からの表示を右上に変更するコード)
    ;; guide-key-tip/pos-tip-showの定義で
    ;;
    ;;   string 'pos-tip-temp 1 wnd 300 tipwidth tipheight nil dx dy))))))))
    ;;                              ↓
    ;;   string 'pos-tip-temp 1 wnd 300 tipwidth tipheight nil dx 0))))))))
    ;; と変更する
    )

  )

(provide 'guide-key-init)

(pos-tip-x-display-height)
(pos-tip-x-display-width)
