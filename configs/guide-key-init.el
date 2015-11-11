
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
  (setq guide-key/text-scale-amount -2)

  (guide-key-mode 1)

  (when window-system                   ; not on terminal
    ;; tipで表示させる
    (use-package guide-key-tip
      :config
      (setq guide-key-tip/enabled t)

      (set-face-foreground 'guide-key-tip/pos-tip-face "black")
      (set-face-background 'guide-key-tip/pos-tip-face "light cyan")
      (set-face-bold 'guide-key-tip/pos-tip-face nil)))


  ;; このサイトのやつ動かないぞ
  ;; ;; from http://qiita.com/akisute3@github/items/88124a1399fc7fe9d419

  )

(provide 'guide-key-init)
