
(use-package auto-complete
  :init
  ;; 辞書の場所を登録
                                        ;(add-to-list 'ac-dictionary-directories "~/.emacs.d/dic/auto-complete")
  :config

  (use-package auto-complete-config :config (ac-config-default))

  ;; acのトリガーキー
  ;;(ac-set-trigger-key "TAB")
  ;;(setq ac-auto-start nil) ;; 自動的に補完しないようにする

  (setq ac-use-menu-map t) ; 補完メニューを使う?

  (bind-keys :map ac-menu-map
             ("C-j" . ac-next)
             ("C-k" . ac-previous))

  (setq completion-ignore-case t );; 補完時に大文字小文字の区別をしない
  (setq ac-ignore-case 'smart) ;; 大文字がある場合だけ区別する
  (setq read-file-name-completion-ignore-case t)

  (setq ac-auto-start 3) ;; 補完を始める文字数
  (setq ac-delay 0.05) ;; 補完を始める時間
  (setq ac-auto-show-menu 0.05) ;; 補完メニューを表示させる時間
  (setq ac-use-fuzzy t) ;; 曖昧な補完を有効にする
  (setq ac-use-comphist t) ;; 補完の時に推測させる

  )


;; using zlc when find-file
(use-package zlc
  :config
  (zlc-mode t)
  (bind-keys :map minibuffer-local-map
    ("<down>"    . zlc-select-next-vertical)
    ("<up>"      . zlc-select-previous-vertical)
    ("<right>"   . zlc-select-next)
    ("<left>"    . zlc-select-previous)
    ("M-n"       . zlc-select-next-vertical)
    ("M-p"       . zlc-select-previous-vertical)
    ("C-M-<tab>" . zlc-select-previous)
    ("C-c r"     . zlc-reset))
  )

(provide 'complete-init)
