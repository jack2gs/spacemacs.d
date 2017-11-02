;; setting the font
;; default is Source Code Pro 13
;; for Chinese, Microsoft Yahei 16
(melon-osx/private-set-font)

;; disable terminal theme
(add-hook 'window-setup-hook 'melon-osx/on-after-init)

;; utf-8 encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
