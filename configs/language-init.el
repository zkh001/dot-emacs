
;; quickrun
(use-package quickrun
  :config
  ;; disable : output results to file
  (setq quickrun-input-file-extension nil)

  ;;
  ;; binding
  ;;
  (define-prefix-command 'quickrun-prefix)
  (bind-key "C-q C-c" 'quickrun-prefix)

  (bind-key "C-q C-c C-q" 'quickrun)
  (bind-key "C-q C-c C-a" 'quickrun-with-arg)
  (bind-key "C-q C-c C-r" 'quickrun-region)
  (bind-key "C-q C-c C-s" 'quickrun-region)
  (bind-key "C-q C-c C-c" 'quickrun-compile-only)
  (bind-key "C-q C-c C-i" 'quickrun-autorun-mode) ;; enable : quickrun after saving
  )

;; programming lang inits
(require 'c-c++-lang-init nil t)
(require 'python-lang-init nil t)
(require 'ruby-lang-init nil t)
(require 'js-lang-init nil t)
(require 'shell-script-init nil t)
(require 'tex-init nil t)
;; web-mode configures in the following
(require 'web-langs-init nil t)

(provide 'language-init)
