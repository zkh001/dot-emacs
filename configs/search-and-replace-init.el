;;;;;;;;;;;;;;;
;; searching ;;
;;;;;;;;;;;;;;;

;; 範囲を選択してからisearchをすると,その範囲が入力された状態で検索できるようにする
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
    ad-do-it))


;; swoop
(use-package swoop
  :config
  ;;;
  ;;; binding
  ;;;

  ;; (define-prefix-command 'swoop-prefix)
  ;; (bind-key "C-q C-o" 'swoop-prefix)
  (bind-keys :prefix-map swoop-prefix
             :prefix "C-q C-]"
             ("C-o" . swoop)
             ("C-l" . swoop-multi)
             ("C-r" . swoop-pcre-regexp)
             ("C-b" . swoop-back-to-position)
             ("C-e" . swoop-edit)
             ("C-s" . swoop-edit-finish)
             )

  (bind-key "C-o" 'swoop-from-isearch isearch-mode-map)
  (bind-key "C-o" 'swoop-multi-from-swoop swoop-map)
  ;(bind-key "C-o" 'swoop-from-evil-search evil-motion-state-map)
  )


;; helm-swoop
;; ace-iseachを使うならいらないかも?
(use-package helm-swoop
  :config
  ;;;
  ;;; binding
  ;;;
  (bind-key "C-q C-h C-o C-o"   'helm-swoop)
  (bind-key "C-q C-h C-o C-M-o" 'helm-swoop-back-to-last-point)
  (bind-key "C-q C-h C-o C-l"   'helm-multi-swoop)
  (bind-key "C-q C-h C-o C-a"   'helm-multi-swoop-all)
  )

;;https://github.com/tam17aki/ace-isearch
(use-package ace-isearch
  :config
  (global-ace-isearch-mode +1)

  (setq ace-isearch-input-length 6)
  ;; 入力からace-jumpが発動するまでの時間
  (setq ace-isearch-jump-delay 2.0)
  ;; (setq ace-isearch-use-jump 'printing-char)
  (setq ace-isearch-use-jump t)
  )


;;;;;;;;;;;;;;;
;; replacing ;;
;;;;;;;;;;;;;;;


(provide 'search-and-replace-init)
