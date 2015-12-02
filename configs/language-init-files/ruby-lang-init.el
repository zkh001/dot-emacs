(use-package ruby-modepo
  :config
  ;; rcodetools
  ;; $> gem install rcodetools
  (use-package rcodetools
    :if (executable-find "xmpfilter")
    :config
    (bind-keys :map ruby-mode-map
               ;; :prefix-map ruby-tools-prefix
               :prefix "M-p C-x"
               ("x" . xmp) ;xmpfilter
               )
    )

  (use-package yard-mode
    :config
    (add-hook 'ruby-mode-hook (lambda ()
                                (setq yard-use-eldoc t)
                                (yard-mode t)
                                (eldoc-mode t))))

  (add-hook 'ruby-mode-hook
            (lambda ()
              (use-package ruby-block)
              (use-package ruby-end)
              (use-package rbenv
                :config
                (global-rbenv-mode)
                ;; if you installed rbenv in not HOME dir, you maybe change it
                ;; (setq rbenv-installation-dir "/usr/local/rbenv")
                ;;(setq rbenv-show-active-ruby-in-modeline nil)
                )
              (ruby-block-mode t)
              (setq ruby-block-highlight-toggle t)
              (ruby-end-mode t)

              (auto-complete-mode t)

              (abbrev-mode t)
              (electric-pair-mode t)
              (add-to-list 'electric-pair-pairs '(?| . ?|))
              (electric-indent-mode t)

              ;; 状況に応じて改行の挙動を変えてくれるやつ
              (smart-newline-mode 1)))
  )


;; you must install pry.
;; $> gem install pry pry-doc
(use-package robe
  :if (executable-find "pry")
  :config
  (add-hook 'ruby-mode-hook 'robe-mode)
  (autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
  (add-hook 'robe-mode-hook 'ac-robe-setup)
  )

;; (defun run-robe ()
;;   (interactive)
;;   (inf-ruby)
;;   (robe-start))

;;;;; Rails ;;;;;
(use-package rinari
  :config
  ;;
  ;; binding
  ;;
  (bind-keys :map ruby-mode-map
             ("M-p f c" . rinari-find-controller)
             ("M-p f e" . rinari-find-environment)
             ("M-p f f" . rinari-find-file-in-project)
             ("M-p f h" . rinari-find-helper)
             ("M-p f i" . rinari-find-migration)
             ("M-p f j" . rinari-find-javascript)
             ("M-p f P" . rinari-find-plugin)
             ("M-p f m" . rinari-find-model)
             ("M-p f n" . rinari-find-configuration)
             ("M-p f o" . rinari-find-log)
             ("M-p f p" . rinari-find-public)
             ("M-p f s" . rinari-find-script)
             ("M-p f t" . rinari-find-test)
             ("M-p f v" . rinari-find-view)
             ("M-p f w" . rinari-find-worker)
             ("M-p f x" . rinari-find-fixture)
             ("M-p f y" . rinari-find-stylesheet)

             ("M-p s" . rinari-script)
             ("M-p e" . rinari-insert-erb-skeleton)
             ("M-p r" . rinari-rake)
             ("M-p w" . rinari-web-server)
             ("M-p x" . rinari-extract-partial)
             ("M-p ;" . rinari-find-by-context)
             ("M-p d" . rinari-cap)
             ("M-p q" . rinari-sql)
             ("M-p u" . rinari-test)
             ("M-p c" . rinari-console)
             ("M-p g" . rinari-rgrep)
             ("M-p p" . rinari-goto-partial)
             ("M-p '" . rinari-find-by-context))
  )

(use-package projectile-rails
  :config
  (bind-keys :map projectile-rails-mode-map
             :prefix-map my-rails-find-prefix
             :prefix "M-p f"
             ("c" . projectile-rails-find-controller        ) ;controller
             ("C" . projectile-rails-find-current-controller)
             ("m" . projectile-rails-find-model             ) ;model
             ("M" . projectile-rails-find-current-model     )
             ("v" . projectile-rails-find-view              ) ;view
             ("V" . projectile-rails-find-current-view      )
             ("h" . projectile-rails-find-helper            ) ;helper
             ("H" . projectile-rails-find-current-helper    )
             ("l" . projectile-rails-find-lib               ) ;lib
             ("L" . projectile-rails-find-layout            ) ;layout
             ("s" . projectile-rails-find-spec              ) ;spec
             ("S" . projectile-rails-find-current-spec      )
             ("t" . projectile-rails-find-test              ) ;test
             ("T" . projectile-rails-find-current-test      )
             ("i" . projectile-rails-find-migration         ) ;migration
             ("I" . projectile-rails-find-current-migration)
             ("u" . projectile-rails-find-fixture          ) ;fixture
             ("U" . projectile-rails-find-current-fixture  )
             ("a" . projectile-rails-find-locale           ) ;locale
             ("b" . projectile-rails-find-job              ) ;job
             ("e" . projectile-rails-find-environment      ) ;env
             ("i" . projectile-rails-find-initializer      ) ;initializer
             ("j" . projectile-rails-find-javascript       ) ;js
             ("o" . projectile-rails-find-log              ) ;log
             ("s" . projectile-rails-find-stylesheet       ) ;ss
             ("r" . projectile-rails-find-rake-task        ) ;rake task
             ("F" . projectile-rails-find-feature          ) ;feature
             ("@" . projectile-rails-find-mailer           ) ;mailer
             ("!" . projectile-rails-find-validator        ) ;validator
             )
  (bind-keys :map projectile-rails-mode-map
             :prefix-map my-rails-goto-prefix
             :prefix "M-p g"
             ("f" . projectile-rails-goto-file         )
             ("F" . projectile-rails-goto-file-at-point)
             ("g" . projectile-rails-goto-gemfile      )
             ("h" . projectile-rails-goto-spec-helper  )
             ("r" . projectile-rails-goto-routes       )
             ("s" . projectile-rails-goto-schema       )
             ("S" . projectile-rails-goto-seeds        )
             )

  (bind-keys :map projectile-rails-mode-map
             ("M-p d" . projectile-rails-destroy       )
             ("M-p s" . projectile-rails-server        )
             ("M-p v" . projectile-rails-rake          )
             ("M-p G" . projectile-rails-generate      )
             ("M-p x" . projectile-rails-extract-region)
             )

  (add-hook 'ruby-mode-hook (lambda () (projectile-rails-on)))
  )

(use-package rspec-mode
  :config
  (custom-set-variables '(rspec-use-rake-flag nil))

  (bind-keys :map rspec-verifiable-mode-map
             :prefix-map my-rspec-prefix
             :prefix "M-p r"
             ("v" . rspec-verify)
             ("a" . rspec-verify-all)
             ("t" . rspec-toggle-spec-and-target)
             ("e" . rspec-toggle-spec-and-target-find-example)
             ("4 t" . rspec-find-spec-or-target-other-window)
             ("4 t" . rspec-find-spec-or-target-find-example-other-window)
             ("r" . rspec-rerun)
             ("m" . rspec-verify-matching)
             ("c" . rspec-verify-continue)
             ("s" . rspec-verify-method)
             ("f" . rspec-run-last-failed)
             )

  (bind-keys :map rspec-mode-map
             :prefix-map my-in-rspec-prefix
             :prefix "M-p r"
             ("r s" . rspec-verify-single)
             ("r d" . rspec-toggle-example-pendingness))

  (bind-keys :map rspec-dired-mode-map
             :prefix-map my-rspec-dired-prefix
             :prefix "M-p r"
             ("v" . rspec-dired-verify)
             ("s" . rspec-dired-verify-single)
             ("a" . rspec-verify-all)
             ("r" . rspec-rerun))
  )

(provide 'ruby-lang-init)
