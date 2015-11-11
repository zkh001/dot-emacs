;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  my-color-theme.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftheme my-color
 "This theme is based on theme of tangotango")

;; describe-face 
(custom-theme-set-faces
 'my-color

 ;; foreground
 '(default ((t (:background "gray25" :foreground "#f0ffff"))))
 ;;cursor color
 '(cursor ((t (:foreground "#ff83fa"))))

 ;;region color
; '(region ((t (:background "#e0e8ee"))))
 '(region ((t (:background "#8c8c8c"))))
 ;; mode-line color
; '(mode-line ((t (:foreground "#F8F8F2" :background "#afeeee"
;                  :box (:line-width 1 :color "#cdcdc1" :style released-button)))))
; '(mode-line-buffer-id ((t (:foreground nil :background nil))))
; '(mode-line-inactive ((t (:foreground "#BCBCBC" :background "#333333"
;                           :box (:line-width 1 :color "#333333")))))


 ;; name
;; '(font-lock-comment-face ((t (:foreground "#ffc1c1"))))

 ;; fringe
 '(fringe ((t (:background "#708090"))))

 ;; comment
 '(font-lock-comment-face ((t (:foreground "#00ee76"))))

 ;; highlight color
 '(highlight ((t (:foreground "black" :background "gray25"))))
 '(hl-line ((t (:background "gray30"))))

 ;; function name
 '(which-func ((t (:foreground "#cae1ff"))))

;; ;; paren color
;; '(show-paren-match-face ((t (:foreground "#1B1D1E" :background "#FD971F"))))
;; '(paren-face ((t (:foreground "#A6E22A" :back))))
)

(provide-theme 'my-color)
