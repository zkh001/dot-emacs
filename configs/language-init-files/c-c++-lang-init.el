
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun my:c-common-init ()
  (setq c-basic-offset 2)
  (setq comment-style 'extra-line)
  ;;     (setq comment-style 'multi-line)
  (setq comment-start "/* ")
  (setq comment-end " */")
  (use-package auto-complete-c-headers
    :config
    (add-to-list 'ac-sources 'ac-source-c-headers))


  ;; (defun comment-dwim-dwim(start end &optional arg)
  ;;   (interactive "r")
  ;;   (if (eq (count-lines-region start end) 1)
  ;;       (progn
  ;;         (defvar-local one-line-comment-start "//")
  ;;         (defvar-local one-line-comment-end "")
  ;;         (setq comment-start one-line-comment-start)
  ;;         (setq comment-end one-line-comment-end)
  ;;         (comment-dwim-2 start end))
  ;;     (progn
  ;;       (defvar-local multi-line-comment-start "/* ")
  ;;       (defvar-local multi-line-comment-end " */")
  ;;       (setq comment-start multi-line-comment-start)
  ;;       (setq comment-end multi-line-comment-end)
  ;;       (comment-dwim-2 start end))))

  )

(add-hook 'c-mode-hook 'my:c-common-init)
(add-hook 'c++-mode-hook 'my:c-common-init)

(provide 'c-c++-lang-init)
