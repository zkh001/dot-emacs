
(use-package python
  :defer t
  :config
  (bind-keys :map python-mode-map
             :prefix-map py-smp
             :prefix "M-p"
             ("x" . (lambda () (interactive) (insert "lambda ")))
             ("e" . (lambda () (interactive) (insert "return ")))

             ("m" . (lambda () (interactive) (insert "map()") (backward-char 1)))
             ("f" . (lambda () (interactive) (insert "filter()") (backward-char 1)))
             ("r" . (lambda () (interactive) (insert "reduce()") (backward-char 1)))

             ("l" . (lambda () (interactive) (insert "len()") (backward-char 1)))
             ("a" . (lambda () (interactive) (insert "list()") (backward-char 1)))

             ("s" . (lambda () (interactive) (insert ".format()") (backward-char 1)))
             )
  )

;; pip :
;; pip is a package-manager for Python.
;; INSTALL : reference -> https://pip.pypa.io/en/latest/installing.html
;; (maybe,,, you need permission on Ubuntu ...)
;; $> wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
;; $> python get-pip.py or ./get-pip.py
;;   *recommended before using pip first : $> pip install -U pip
;;   *( -U option is upgrade )
;; $> pip install virtualenv
;; here, you can you use jedi in the emacs!!

;; pyton on virtual environment dir is created in ~/.emacs.d/ by default. if you change creating dir, you change the followings
;; ~ jedi:environment-root
;; ~ python-environment-directory
;; ~ python-environment-default-root-name

;; jedi
;; REQUIREMENT : pip, virtualenv
;;
;; finally, you should executte the following
;; (in emacs) M-x jedi:install-server
(use-package jedi
  :if (and (executable-find "pip") (executable-find "virtualenv"))
  :config
  (eval-when-compile
    (use-package f))
  ;; if you don't set-up jedi-server yet, install it first.
  (unless (f-exists? "~/.emacs.d/.python-environments")
    (message "------------   python environment is not exist   --------------")
    (jedi:install-server))

  (add-hook 'python-mode-hook 'jedi:setup)

  (setq jedi:complete-on-dot t)
  )

(provide 'python-lang-init)
