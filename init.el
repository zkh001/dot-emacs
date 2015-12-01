;; add-to-listの読み込み時にコンパイルする版
(defun add-to-load-path-recompile (dir)
  (add-to-list 'load-path dir)
  (let (save-abbrevs) (byte-recompile-directory dir)))

;; 再帰的にロードパスに追加する関数
(defun add-to-load-paths (&rest paths)
  (dolist (path paths)
    (let ((lpath (expand-file-name (locate-user-emacs-file path))))
      (when (file-directory-p lpath)
        (add-to-load-path-recompile lpath)
        ;; also add sub-directories
        (when (fboundp 'normal-top-level-add-subdirs-to-load-path)
          ;; サブディレクトリを再帰的にロードパスに追加する
            (setq default-directory lpath)
            (normal-top-level-add-subdirs-to-load-path)))))
  (setq default-directory "~/"))

;;ロードパスに追加する
;; (add-to-load-paths "configs" "el-get" "dic" "backup" "info" "themes")
(add-to-load-paths "configs" "el-get" "dic" "info" "themes")

;; load config files
(unless (require 'package-management nil t)
  (require 'use-package))

;; パッケージに依存しないところ
(require 'my-function)
(require 'global-bind-init)
(require 'basic-init)

;; パッケージに依存するところ
(require 'helm-init)
(require 'popwin-init)
(require 'guide-key-init)
(require 'tiny-pkgs-init)
(require 'flycheck-init)
(require 'org-init)
(require 'tabbar-init)

(require 'complete-init)
(require 'editor-init)
(require 'search-and-replace-init)
(require 'input-method-init)
(require 'directory-init)
(require 'browser-init)

(require 'shell-init)

(require 'language-init)
