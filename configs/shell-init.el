;;;;;;;;;;;;;;;
;;  パス関係  ;;
;;;;;;;;;;;;;;;

;; ターミナルのパスを~/.emacs.d/shell/shellenv.elに出力する
(when (my-create-term-environment-path "~/.emacs.d" "shellenv.el")
  ;; 生成したパスのファイルを読み込んでexec-pathに追加
  (load-file (expand-file-name "~/.emacs.d/shellenv.el"))
  (dolist (path (reverse (split-string (getenv "PATH") ":")))
    (add-to-list 'exec-path path)))

;;;;;;;;;;;;;;;;;;;;;;
;;;   multi-term   ;;;
;;;;;;;;;;;;;;;;;;;;;;

(use-package multi-term
  :if (my-find-shell)
  :config

  (setq shell-file-name (my-find-shell))
  (setenv "SHELL" shell-file-name)
  (setenv "LANG" "ja_JP.UTF-8")         ; 日本語表示が可能に
  (setq explicit-shell-file-name shell-file-name)

  (when (eq system-type "darwin")
    (setenv "TERMINFO" "~/.terminfo"))

  ;;
  (setq term-unbind-key-list '("C-q" "C-s" "C-h" "C-j"
                               "C-k" "C-l" "C-n"
                               "C-t" "C-SPC" "M-x"))

  ;; multi-termでのバインドを無効にする
  (setq term-bind-key-alist
        '(("C-z" . nil) ;; tmuxを使う時のプレフィックスだから
          ("C-@" . nil)
          ("C-h" . nil) ;; 補完の移動が競合する
          ("C-j" . nil)
          ("C-k" . nil)
          ("C-l" . nil)
          ))


  ;; term内で有効にするemacs側のバインド
  (setq term-bind-key-alist
        '(("C-v" . tabbar-forward-tab)
          ("C-M-v" . tabbar-backward-tab)
          ("C-s" . Control-X-prefix)
          ("M-x" . term-send-M-x)
          ("C-n" . execute-extended-command)
          ("C-y" . term-paste)
          ("C-b" . my-term-send-backspace)
          ("C-d" . term-send-del)
          ("<escape>" . my-term-send-escape) ;; ESCを入力可能に
          ("C-h" . term-send-left)
          ("C-l" . term-send-right)
          ("C-j" . term-send-raw)
          ("C-k" . term-send-raw)
          ))

  (add-hook 'term-mode-hook
            '(lambda ()
               (local-set-key (kbd "C-j") 'term-send-raw)
               (local-set-key (kbd "C-k") 'term-send-raw)
               (yas-minor-mode 0) ;; yasnippetとTABが競合するため
               ))

  ;;
  ;; binding
  ;;

  (bind-key "C-q C-t" 'multi-term)

  )




;;;;;;;;;;;;;;;;;;
;;;   eshell   ;;;
;;;;;;;;;;;;;;;;;;
(use-package eshell
  :config
  ;; 大文字小文字の区別をしない
  (setq eshell-cmpl-ignore-case t)
  ;; ヒストリの重複を無視
  (setq eshell-hist-ignoredups t)
  ;; ヒストリ保存の際に確認しない
  (setq eshell-ask-to-save-last-dir 'always)

  ;;
  ;; pcomplete
  ;;

  ;; sudoでコマンドの補完をできるようにする
  (defun pcomplete/sudo ()
    "Completion rules for the `sudo' command."
    (let ((pcomplete-help "complete after sudo"))
      (pcomplete-here (pcomplete-here (eshell-complete-commands-list)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; define eshell/command ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; clear eshell window
  (defun eshell/clear ()
    "Clear the current buffer, leaving one prompt at the top."
    (interactive)
    (let ((inhibit-read-only t))
      (erase-buffer)))
  ;; end

  ;;
  ;;  Load Eshell file
  ;;

  ;; 'j' key
  (eval-after-load 'eshell
    '(use-package eshell-autojump))


;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Eshell Aliases  ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;
  ;; Binding Key
  ;;
  (bind-key "C-q C-e" 'eshell)

  (add-hook 'eshell-mode-hook
            '(lambda ()
               (bind-key "TAB" 'eshell-pcomplete eshell-mode-map) ;;'pcomplete-expand-and-complete)
               (bind-key "C-j" 'next-line        eshell-mode-map)
               ))
  )


(provide 'shell-init)
