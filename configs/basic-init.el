;; This configure is basic functions of the Emacs 
;; without depending any package.

;; common lispなマクロを使えるようにする
(eval-when-compile (use-package cl))

;; emacsclientに常時接続できるようにする
(use-package server
  :if (if window-system (server-start)))

;;スクリプトファイルに実行権限を自動で付与する
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; バックアップファイルを生成しない
(setq make-backup-files nil)
(setq auto-save-default nil)


;; バイトコンパイル時のWarningを抑制する
(setq byte-compile-warnings '(free-vars
                              unresolved
                              callargs
                              redefine
                              obsolete
                              noruntime
                              cl-functions
                              interactive-only
                              make-local))

;;;;;;;;; Encoding ;;;;;;;
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
;(set-language-environment       "Japanese")
;(prefer-coding-system           'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system  'utf-8)
(set-terminal-coding-system     'utf-8)
(set-keyboard-coding-system     'utf-8)
(set-clipboard-coding-system    'utf-8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 現在の関数名を表示
(which-function-mode t)

;; ツールバーを非表示
(tool-bar-mode -1)
;; メニューバーを非表示
(menu-bar-mode -1)

;; ファイルの絶対パスを表示
(setq frame-title-format "%f")


;; 起動画面を表示しない
(setq inhibit-startup-message t)

;; *scratch*バッファのあのメッセージを消すぜ
(setq initial-scratch-message "")

;; マウスの点滅をなくす
(blink-cursor-mode 0)

;; ;; 最後の行に必ず1行を挿入する
;; (setq require-final-newline t)

;; yes/no => y/n
(fset 'yes-or-no-p 'y-or-n-p)


;;リージョンを一括削除(上書き)するようにする
(delete-selection-mode 1)

;; Xクリップボードとキリングを同期する
(setq x-select-enable-clipboard t)

;; 画像を表示できるようにする
(auto-image-file-mode t)

;; キーストロークを早く表示
(setq echo-keystrokes 0.1)

;; 矩形選択が簡単なcua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil) ;通常のキーバインドでコピペ

;; 一行ずつのスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;; emacsの動作を多少軽くする?
(setq-default bidi-display-reordering nil
              bidi-paragraph-direction (quote left-to-right))

;; 対応括弧の強調
(show-paren-mode t) ;有効化
(setq show-paren-style 'expression) ;括弧内も強調
(setq show-paren-delay 0) ;表示までの遅延(s)

;; 現在行を目立たせる
(global-hl-line-mode)

;;;;;;;;;; Color ;;;;;;;;;

;; テーマを読み込む
(setq custom-theme-directory "~/.emacs.d/themes/") ; 独自テーマ

(load-theme 'my-color t t)
(enable-theme 'my-color)
;; (load-theme 'THEME-NAME t t)
;; (enable-theme 'THEME-NAME)

;; 透明度
(add-to-list 'default-frame-alist '(alpha . 80))

;; キーワードの色付けをする
(global-font-lock-mode t)



(provide 'basic-init)
