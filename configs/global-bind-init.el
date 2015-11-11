(use-package bind-key)

;; C-xのプレフィックスキーをC-sでもできるようにする
;; 2ストローク目のC-sはちゃんとC-sのまま<=正直面倒くさいから
(bind-key "C-s" 'Control-X-prefix)

;; M-xをC-nでも使えるようにする
(bind-key "C-n" 'execute-extended-command)

;; 改行+インデント
(bind-key "C-m" 'newline-and-indent)

;; C-bをbackspaceに
(bind-key "C-b" 'delete-backward-char)

;; vimライクな移動がしたいからそうする!!
(bind-key* "C-h" 'left-char)     ;;左
(bind-key* "C-j" 'next-line)     ;;下
(bind-key* "C-k" 'previous-line) ;;上
(bind-key* "C-l" 'right-char)    ;;右

(bind-key* "M-h" 'left-word)            ; 単語移動
(bind-key* "M-l" 'right-word)           ; 
(bind-key* "M-j" 'forward-sentence)     ; 文移動
(bind-key* "M-k" 'backward-sentence)    ; 

;;ウィンドウ移動の設定
(bind-key "C-t" 'other-window)
(bind-key "C-M-t" 'my-move-window-backward)

;; キル関係
(bind-keys* :prefix-map killing-prefix
            :prefix "C-q C-k"
            ("c" . kill-comment)
            ("l" . kill-line)
            ("p" . kill-sexp)
            ("s" . kill-sentence)
            ("w" . backward-kill-word)
            ("W" . kill-word))

;; C-f,C-M-fでインクリメンタルサーチ
(bind-key "C-f" 'isearch-forward)
(bind-key "C-f" 'isearch-repeat-forward isearch-mode-map)
(bind-key "C-M-f" 'isearch-forward-regexp)
(bind-key "C-M-f" 'isearch-repeat-forward isearch-mode-map)

;; 上のカーソル移動の設定で追いやられたやつを別のところに移す
(bind-key "C-c k" 'kill-line)

;; 矩形選択
(bind-key "C-p" 'rectangle-mark-mode)
(bind-key "<C-return>" 'rectangle-mark-mode)

;; 一行削除
(bind-key "M-d" 'my-kill-line)

(bind-key "<M-return>" 'indent-new-comment-line)

;; 独自のプレフィックスキーを定義する
;; define my-prefix
(define-prefix-command 'my-prefix)
(bind-key "C-q" 'my-prefix) ; quoted-insert -> my-prefix

(bind-key "C-q C-q" 'quoted-insert)
(bind-key "C-q t"   'other-window)
(bind-key "C-q M-g" 'grep)
(bind-key "C-q C-v" 'view-mode)
(bind-key "C-q <C-return>"   'toggle-truncate-lines)

(bind-keys :prefix-map formattings-prefix
           :prefix "C-q C-f"
           ( "C-f" . my-indent-whole-buffer)
           ( "C-a" . align-regexp)
           ( "C-l" . align))


;; 置換関係
(bind-keys :prefix-map replacing-prefix
           :prefix "C-q C-r"
           ("r"   . query-replace-regexp)
           ("C-q" . query-replace)
           ("C-b" . re-builder))

;; 標準にあるくり返し機能
(bind-key "C-q C-z" 'repeat)
(bind-key "C-q z" 'repeat-complex-command)
(setq repeat-on-final-keystroke "z")

;; M-pはプログラミング言語のモード毎のコマンド設定をする
(define-prefix-command 'my-programming-prefix)
(bind-key "M-p" 'my-programming-prefix)

(provide 'global-bind-init)
