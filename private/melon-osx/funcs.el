;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
(defun melon-osx/set-font (efont efont-size cfont cfont-size)
  (interactive)
  ;; font config for org table showing.
  (set-face-attribute 'default nil
                      :font (format "%s:pixelsize=%d"  efont efont-size))
  ;; Chinese Font 配制中文字体
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family cfont :size cfont-size))))
