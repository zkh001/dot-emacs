(provide 'tabbar-init)

(use-package tabbar
  :config
  (tabbar-mode 1)

  ;; タブ間の間隔
  (setq tabbar-separator '(1.5))

  ;; タブ上のマウスホイールを無効
  (tabbar-mwheel-mode -1)

  ;; タブをグループ化しない
  (setq tabbar-buffer-groups-function nil)

  ;; 左側に出るボタンを消す
  (dolist (btn '(tabbar-buffer-home-button
                 tabbar-scroll-left-button
                 tabbar-scroll-right-button))
    (set btn (cons (cons "" nil)
                   (cons "" nil))))

  ;; タブを省略して表示する
  (setq tabbar-auto-scroll-flag nil)

  ;; 表示タブの設定
  (defun my-tabbar-func ()
    (delq nil
          (mapcar
           #'(lambda (buf)
               (cond
                ((eq (current-buffer) buf) buf)
                ((buffer-file-name buf) buf)
                ((char-equal ?\ (aref (buffer-name buf) 0)) nil)
                ;; 表示させるバッファ

                ;; ((equal "*scratch*" (buffer-name buf)) buf)
                ;; ((equal "*Help*" (buffer-name buf)) buf)
                ((equal "*Colors*" (buffer-name buf)) buf)
                ;; multi-terminal
                ((string-match "\\*terminal<[0-9]?[0-9]>\\*" (buffer-name buf)) buf)
                ;; eshell
                ((string-match "\\*eshell\\(<[0-9]?[0-9]>\\)?\\*" (buffer-name buf)) buf)
                ((equal "*SQL*" (buffer-name buf)) buf)
                ((equal "*ruby scratch*" (buffer-name buf)) buf)

                ;; *で始まるバッファは表示しない
                ((char-equal ?* (aref (buffer-name buf) 0)) nil)
                ((buffer-live-p buf) buf)))
           (buffer-list))))
  (setq tabbar-buffer-list-function 'my-tabbar-func)

  ;; Bind
  (bind-key "C-v"   'tabbar-forward-tab)
  (bind-key "C-M-v" 'tabbar-backward-tab)

  ;; Faces
  (set-face-attribute
   'tabbar-unselected nil
   :foreground "white")
  
  (set-face-attribute
   'tabbar-selected nil
   :foreground "green")

  (set-face-attribute
   'tabbar-modified nil
   :foreground "light pink")
   )
