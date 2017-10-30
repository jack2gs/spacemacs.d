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
(defun melon-osx/set-default-font ()
    (melon-osx/set-font "Source Code Pro" 13 "Microsoft Yahei" 16)
    )

(defun melon-osx/private-set-font ()
  (add-to-list 'after-make-frame-functions
               (lambda (new-frame)
                 (select-frame new-frame)
                 (if window-system
                     (melon-osx/set-default-font))))
  (if window-system
      (melon-osx/set-default-font))
  )
