
;;; NOTE : DDSKK
;;; FIRST, you must make at DDSKK elisp(package) dir
;;;

(eval-when-compile
  (use-package skk-vars))

(use-package skk-autoloads
  :config

  (setq skk-user-directory "~/.emacs.d/.skk")

  ;; skk dictinary path
  (setq skk-large-jisyo "~/.emacs.d/dic/skk/SKK-JISYO.L")
  (setq skk-tut-file "~/.emacs.d/info/skk/SKK.tut")

  ;; preload
  (setq skk-preload t)

  (setq default-input-method "japanese-skk")

  ;; Shiftキーを使わないくてもよくなるよ
  (setq skk-sticky-key ";")

  (add-hook 'skk-load-hook
            (lambda ()
              (use-package context-skk)

              ;; 句読点を半角に変更 。、=> .,
              (setq-default skk-kutouten-type 'en)

              ;; 確定キーを改行でも可能にする
              (setq skk-egg-like-newline t)

              ;; 自動で括弧を入れる
              (setq skk-auto-insert-paren t)


              (setq skk-henkan-strict-okuri-precedence t)
              (setq skk-check-okurigana-on-touroku t)

              ;; @で挿入する日付表示を半角に
              (setq skk-number-style nil)

              ;; 全角の状態でも半角にしたい文字の設定
              (setq skk-rom-kana-rule-list
                    (nconc skk-rom-kana-rule-list
                           '((";" nil nil)
                             (":" nil nil)
                             ("?" nil nil)
                             ("!" nil nil))))))

  ;; ファイルを開いたときにSKKを起動するようにする
  (add-hook 'find-file-hooks
            (lambda ()
              (skk-mode)
              (skk-latin-mode t)))

  ;; このキーでlキー(半角英数字)を日本語入力(かな)に切り替えられる
  (setq skk-kakutei-key "\C-o")


  ;; 各種メッセージを日本語で通知する
  (setq skk-japanese-message-and-error t)

  ;;;
  ;;; binding
  ;;;
  (bind-key "C-q C-s" 'skk-mode)

  )

(provide 'input-method-init)
