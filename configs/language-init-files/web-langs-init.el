(use-package css-mode
  :config
  (add-hook 'css-mode-hook '(lambda ()
                              (eldoc-mode 1)
                              (turn-on-css-eldoc))))

;; web-mode
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ctp?$" . web-mode))
  ;; htmlファイルもは好みによるかなぁ
  (add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))

  :config
  (setq web-mode-engines-alist
        '(("php"    . "\\.phtml\\'")
          ("blade"  . "\\.blade\\.")))

  (defun web-mode-hook-func ()
    ;; custom offsets
    (setq web-mode-markup-indent-offset 2) ;htlm elements
    (setq web-mode-css-indent-offset    2) ;css
    (setq web-mode-code-indent-offset   2) ;script code
    ;;(setq web-mode-attr-indent-offset   2) ;tag attr
    (setq web-mode-sql-indent-offset    2) ;sql

    ;; (setq web-mode-auto-close-style 0)  ; non-auto
    ;; (setq web-mode-auto-close-style 1)  ; on </
    (setq web-mode-auto-close-style 2)  ; on > and </

    ;; bindings
    ;; (define-prefix-command 'attribute-prefix)
    ;; (bind-key "M-p a" 'attribute-prefix)

    ;; (define-prefix-command 'block-prefix)
    ;; (bind-key "M-p b" 'block-prefix)

    ;; (define-prefix-command 'dom-prefix)
    ;; (bind-key "M-p d" 'dom-prefix)

    ;; (define-prefix-command 'element-prefix)
    ;; (bind-key "M-p e" 'element-prefix)

    ;; (define-prefix-command 'tag-prefix)
    ;; (bind-key "M-p t" 'tag-prefix)

    (bind-keys :map web-mode-map
               :prefix-map web-mode-attribute-prefix
               :prefix "M-p a"
               ("b" . web-mode-attribute-beginning)
               ("e" . web-mode-attribute-end)
               ("i" . web-mode-attribute-insert)
               ("n" . web-mode-attribute-next)
               ("s" . web-mode-attribute-select)
               ("k" . web-mode-attribute-kill)
               ("p" . web-mode-attribute-previous)
               ("t" . web-mode-attribute-transpose))

    (bind-keys :map web-mode-map
               :prefix-map web-mode-block-prefix
               :prefix "M-p b"
               ("b" . web-mode-block-beginning)
               ("c" . web-mode-block-close)
               ("e" . web-mode-block-end)
               ("k" . web-mode-block-kill)
               ("n" . web-mode-block-next)
               ("p" . web-mode-block-previous)
               ("s" . web-mode-block-select))

    (bind-keys :map web-mode-map
               :prefix-map web-mode-dom-prefix
               :prefix "M-p d"
               ("a" . web-mode-dom-apostrophes-replace)
               ("d" . web-mode-dom-errors-show)
               ("e" . web-mode-dom-entities-replace)
               ("n" . web-mode-dom-normalize)
               ("q" . web-mode-dom-quotes-replace)
               ("t" . web-mode-dom-traverse)
               ("x" . web-mode-dom-xpath))

    (bind-keys :map web-mode-map
               :prefix-map web-mode-element-prefix
               :prefix "M-p e"
               ("/" . web-mode-element-close)
               ("a" . web-mode-element-content-select)
               ("b" . web-mode-element-beginning)
               ("c" . web-mode-element-clone)
               ("d" . web-mode-element-child)
               ("e" . web-mode-element-end)
               ("f" . web-mode-element-children-fold-or-unfold)
               ("i" . web-mode-element-insert)
               ("k" . web-mode-element-kill)
               ("m" . web-mode-element-mute-blanks)
               ("n" . web-mode-element-next)
               ("p" . web-mode-element-previous)
               ("r" . web-mode-element-rename)
               ("s" . web-mode-element-select)
               ("t" . web-mode-element-transpose)
               ("u" . web-mode-element-parent)
               ("v" . web-mode-element-vanish)
               ("w" . web-mode-element-wrap))

    (bind-keys :map web-mode-map
               :prefix-map web-mode-tag-prefix
               :prefix "M-p t"
               ("a" . web-mode-tag-attributes-sort)
               ("b" . web-mode-tag-beginning)
               ("e" . web-mode-tag-end)
               ("m" . web-mode-tag-match)
               ("n" . web-mode-tag-next)
               ("p" . web-mode-tag-previous)
               ("s" . web-mode-tag-select))

    (bind-keys :map web-mode-map
               ("M-;"     . web-mode-comment-or-uncomment)
               ("M-p F"   . web-mode-fold-or-unfold)
               ("M-p h"   . web-mode-buffer-highlight)
               ("M-p i"   . web-mode-buffer-indent)
               ("M-p j"   . web-mode-jshint)
               ("M-p m"   . web-mode-mark-and-expand)
               ("M-p n"   . web-mode-navigate)
               ("M-p r"   . web-mode-reload)
               ("M-p I"   . web-mode-snippet-insert)
               ("M-p W"   . web-mode-whitespaces-show))

    ;; erbファイルを編集するときweb-mode + projectile-rails になるようにする
    ;; ただしキーバインドががが
    (when (string-match "^erb$" (f-ext buffer-file-name))
      (projectile-rails-mode 1))
    )

  (add-hook 'web-mode-hook 'web-mode-hook-func))

;; emmet-mode (zencoding replacement)
(use-package emmet-mode
  :config
  (add-hook 'web-mode-hook '(lambda ()
                              (emmet-mode)))
  (add-hook 'css-mode-hook '(lambda ()
                              (emmet-mode)))
  )



(use-package coffee-mode
  :config
  (defun coffee-mode-hook-func ()
    (bind-keys :map coffee-mode-map
               ("C-m"     . coffee-newline-and-indent) ;gusto
               ("M-p c"   . coffee-compile-buffer)
               ("M-p C"   . coffee-compile-region)
               ("M-p ;"   . coffee-comment-dwin)
               ("M-p h"   . coffee-indent-shift-left)
               ("M-p l"   . coffee-indent-shift-right)
               ("M-p m"   . coffee-mark-defun)
               ("M-p a"   . coffee-beginning-of-defun)
               ("M-p e"   . coffee-end-of-defun)

               ("M-p C-s" . coffee-cos-mode)

               ("M-p r r" . coffee-repl)
               ("M-p r l" . coffee-send-line)
               ("M-p r m" . coffee-send-region)
               ("M-p r b" . coffee-send-buffer)
               )

    )

  (add-hook 'coffee-mode-hook 'coffee-mode-hook-func)
  )

(use-package slim-mode)

;; rainbow-mode
(use-package rainbow-mode
  :config
  (add-hook 'css-mode-hook    'rainbow-mode)
  (add-hook 'php-mode-hook    'rainbow-mode)
  (add-hook 'html-mode-hook   'rainbow-mode)
  (add-hook 'web-mode-hook    'rainbow-mode)
  (add-hook 'coffee-mode-hook 'rainbow-mode)
  (add-hook 'slim-mode-hook   'rainbow-mode)
  )

(provide 'web-langs-init)
