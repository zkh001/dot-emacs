
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

  ;; (add-to-list 'c-mode-common-hook 'my:c-common-init)

  ;; (add-to-list 'c++-mode-hook 'my:c-common-init)
  (add-hook 'c-mode-hook 'my:c-common-init)
  (add-hook 'c++-mode-hook 'my:c-common-init)


  ;; (defun check-executable-clang ()
  ;;   (or (executable-find "clang")
  ;;       (executable-find "clang-3.6")
  ;;       (executable-find "clang-3.5")
  ;;       (executable-find "clang-3.4")
  ;;       (executable-find "clang-3.3")
  ;;       (executable-find "clang-3.2")
  ;;       (executable-find "clang-3.1")
  ;;       nil))

  ;; ;; 1. this package directory
  ;; ;; 2. make LLVM_CONFIG=llvm-config-[version]
  ;; (use-package auto-complete-clang-async
  ;;   :if
  ;;   (check-executable-clang)
  ;;   :config

  ;;   (defun cc-clang-complete-init ()
  ;;     (setq ac-clang-complete-executable "~/.emacs.d/el-get/pkgs/emacs-clang-complete-async/clang-complete")
  ;;     (setq ac-sources (cons 'ac-source-clang-async ac-sources))
  ;;     (ac-clang-launch-completion-process))

  ;;   (add-hook 'c-mode-hook 'cc-clang-complete-init)
  ;;   (add-hook 'c++-mode-hook 'cc-clang-complete-init)
  ;;   )

  (provide 'c-c++-lang-init)
