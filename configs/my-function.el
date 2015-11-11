

;; バッファ全体をインデント
(defun my-indent-whole-buffer ()
  "This function indent whole buffer"
  (interactive)
  (indent-region (point-min) (point-max))
  (delete-trailing-whitespace); 余分な空白を削除する
  )

;; 一行すべてを削除
(defun my-kill-line ()
  "When this func is run, your cursor line will be killed"
  (interactive)
  (beginning-of-line)
  (kill-line))

;; ターミナルにESCを送る
(defun my-term-send-escape ()
  "Send ESC into term/multi-term mode"
  (interactive)
  (term-send-raw-string "\e"))

;; ターミナルにBackSpaceを送る
(defun my-term-send-backspace ()
  "Send DEL into term/multi-term mode"
  (interactive)
  (term-send-raw-string "\d"))

;; 使用するシェルの検索(無ければnil) - zshを優先する
(defun my-find-shell ()
  (or (executable-find "zsh")
      (executable-find "fish")
      (executable-find "tcsh")
      (executable-find "bash")
      nil))


;; パスをファイルに出力(require : perl)
(defun my-create-term-environment-path (dir file_name)
  "create terminal path to file. And, don't need end / of dir-path"
  (cond ((executable-find "perl")
        (shell-command-to-string
         (format  "perl -wle \
    'do { print qq/(setenv \"$_\" \"$ENV{$_}\")/ if exists $ENV{$_} } for @ARGV' \
    PATH > %s/%s" dir file_name)))
        (t
         nil))
  )

;; シェルコマンドをemacsの関数に登録
(defun my-define-shell-command-on-emacs (func_name command)
  "define shell-command function on emacs."
  (lexical-let ((func_name func_name) (command command))
    (defalias func_name
      (lambda ()
        (interactive)
        (async-shell-command command (format "* %s *" func_name))))))

;; preview on eww (工事中)
(defun my-preview-on-eww ()
  (interactive)
  nil)



(provide 'my-function)
