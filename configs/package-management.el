
(when (require 'package nil t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-initialize))

;; if not install the el-get, install it by using git
(unless (require 'el-get nil 'noerror)
  (url-retrieve
   "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

;; 必要なパッケージのチェックとインストール(なければ)
;; (let ((require-packages (list 'use-package 'el-get)))
(let ((require-packages (list 'use-package)))
  (eval-when-compile (require 'cl))
  (let ((install-pkgs (loop for x in require-packages
                           unless (package-installed-p x)
                           collect x)))
    (package-refresh-contents)
    (dolist (pkg require-packages)
      (unless (package-installed-p pkg)
        (package-install pkg)))))

(require 'use-package)

;; git clone https://github.com/dimitri/el-get.git
(require 'el-get)

;;;;;;;;;;;;;;;;;
; makeinfo
; ubuntu : sudo apt-get install texinfo
;;;;;;;;;;;;;;;;

;; The following is bundling packages

(el-get-bundle elpa:auto-complete)
(el-get-bundle elpa:ace-isearch)
(el-get-bundle elpa:ace-jump-buffer)
(el-get-bundle elpa:bind-key)
(el-get-bundle elpa:codic)
(el-get-bundle elpa:coffee-mode)
(el-get-bundle elpa:comment-dwim-2)
(el-get-bundle elpa:css-eldoc)
(el-get-bundle elpa:ctags-update)
(el-get-bundle elpa:duplicate-thing)
(el-get-bundle elpa:eshell-autojump)
;; (el-get-bundle evil)
(el-get-bundle elpa:emmet-mode)
(el-get-bundle elpa:eldoc-extension)
(el-get-bundle elpa:git-gutter+)
(el-get-bundle elpa:google-translate)
(el-get-bundle elpa:guide-key)
(el-get-bundle elpa:guide-key-tip)
(el-get-bundle elpa:helm)
(el-get-bundle elpa:helm-gtags)
(el-get-bundle elpa:helm-projectile)
(el-get-bundle elpa:helm-swoop)
(el-get-bundle elpa:imenus)
(el-get-bundle elpa:imenu-anywhere)
(el-get-bundle elpa:inf-ruby)
(el-get-bundle elpa:jedi)
(el-get-bundle elpa:jedi-direx)
(el-get-bundle elpa:js2-mode)
(el-get-bundle elpa:flycheck)
(el-get-bundle elpa:flycheck-pos-tip)
(el-get-bundle elpa:multi-term)
(el-get-bundle elpa:multiple-cursors)
(el-get-bundle elpa:neotree)
(el-get-bundle elpa:projectile)
(el-get-bundle elpa:projectile-rails)
(el-get-bundle elpa:quickrun)
(el-get-bundle elpa:rainbow-mode)
(el-get-bundle elpa:rbenv)
(el-get-bundle elpa:recentf-ext)
(el-get-bundle elpa:rinari)
(el-get-bundle elpa:robe)
(el-get-bundle elpa:rspec-mode)
(el-get-bundle elpa:ruby-block)
(el-get-bundle elpa:ruby-end)
(el-get-bundle elpa:slim-mode)
(el-get-bundle elpa:slime)
(el-get-bundle elpa:smartrep)
(el-get-bundle elpa:smart-newline)
(el-get-bundle elpa:swoop)
(el-get-bundle elpa:tabbar)
(el-get-bundle elpa:undo-tree)
(el-get-bundle elpa:use-package)
(el-get-bundle elpa:web-mode)
;; (el-get-bundle elpa:which-key)
(el-get-bundle elpa:yasnippet)
(el-get-bundle elpa:yard-mode)
(el-get-bundle elpa:yatex)
(el-get-bundle elpa:zlc)
; (el-get-bundle elpa:nginx-mdoe)

;; they are packages from Github
(el-get-bundle mooz/auto-complete-c-headers)
;; (el-get-bundle skk-dev/ddskk :build '("make" "install"))
(el-get-bundle ddskk)

;; end of Github 

;; ;; org-mode
;; (el-get-bundle org-mode)

;; modern? emacs lib
(el-get-bundle elpa:dash)
(el-get-bundle elpa:f)
(el-get-bundle elpa:s)

(provide 'package-management)
