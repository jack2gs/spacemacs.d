;; setting the font
;; default is Source Code Pro 13
;; for Chinese, Microsoft Yahei 16
(melon-osx/private-set-font)

;; disable terminal theme
(add-hook 'window-setup-hook 'on-after-init)

;; utf-8 encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; active org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((js         . t)
   (emacs-lisp . t)
   (perl       . t)
   (scala      . t)
   (clojure    . t)
   (python     . t)
   (ruby       . t)
   (dot        . t)
   (ditaa      . t)
   (latex      . t)
   (java       . t)
   (R          . t)
   (plantuml   . t)))
