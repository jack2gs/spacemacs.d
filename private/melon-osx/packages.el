;;; packages.el --- melon-osx layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Gao Song <song@GaodeMacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `melon-osx-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `melon-osx/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `melon-osx/pre-init-PACKAGE' and/or
;;   `melon-osx/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst melon-osx-packages
  '(
    exec-path-from-shell
    org
    yasnippet
    )
  "The list of Lisp packages required by the melon-osx layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun melon-osx/post-init-exec-path-from-shell ()
  "Initialize exec-path-from-shell"
    ;; config
    (progn
      (when (memq window-system '(mac ns x))
        (exec-path-from-shell-initialize))
      )
)

(defun melon-osx/post-init-org ()
  "Initilize org"
	       (progn
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
              (shell      . t)
              (plantuml   . t)))

           (require 'ox-latex)
      (setq org-latex-compiler "xelatex")
      (add-to-list 'org-latex-classes
                   '("cn-article"
                     "\\documentclass[10pt,a4paper]{article}
\\usepackage{graphicx}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{lmodern}
\\usepackage{verbatim}
\\usepackage{fixltx2e}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{tikz}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{listings}
\\usepackage{geometry}
\\usepackage{algorithm}
\\usepackage{algorithmic}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
\\usepackage{natbib}
\\usepackage{fancyhdr}
\\usepackage[xetex,colorlinks=true,CJKbookmarks=true,
linkcolor=blue,
urlcolor=blue,
menucolor=blue]{hyperref}
\\usepackage{fontspec,xunicode,xltxtra}
\\setmainfont[BoldFont=Adobe Heiti Std]{Adobe Song Std}
\\setsansfont[BoldFont=Adobe Heiti Std]{AR PL UKai CN}
\\setmonofont{Bitstream Vera Sans Mono}
\\newcommand\\fontnamemono{AR PL UKai CN}%等宽字体
\\newfontinstance\\MONO{\\fontnamemono}
\\newcommand{\\mono}[1]{{\\MONO #1}}
\\setCJKmainfont[Scale=0.9]{Adobe Heiti Std}%中文字体
\\setCJKmonofont[Scale=0.9]{Adobe Heiti Std}
\\hypersetup{unicode=true}
\\geometry{a4paper, textwidth=6.5in, textheight=10in,
marginparsep=7pt, marginparwidth=.6in}
\\definecolor{foreground}{RGB}{220,220,204}%浅灰
\\definecolor{background}{RGB}{62,62,62}%浅黑
\\definecolor{preprocess}{RGB}{250,187,249}%浅紫
\\definecolor{var}{RGB}{239,224,174}%浅肉色
\\definecolor{string}{RGB}{154,150,230}%浅紫色
\\definecolor{type}{RGB}{225,225,116}%浅黄
\\definecolor{function}{RGB}{140,206,211}%浅天蓝
\\definecolor{keyword}{RGB}{239,224,174}%浅肉色
\\definecolor{comment}{RGB}{180,98,4}%深褐色
\\definecolor{doc}{RGB}{175,215,175}%浅铅绿
\\definecolor{comdil}{RGB}{111,128,111}%深灰
\\definecolor{constant}{RGB}{220,162,170}%粉红
\\definecolor{buildin}{RGB}{127,159,127}%深铅绿
\\punctstyle{kaiming}
\\title{}
\\fancyfoot[C]{\\bfseries\\thepage}
\\chead{\\MakeUppercase\\sectionmark}
\\pagestyle{fancy}
\\tolerance=1000
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; use minted to hightlight the source code
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)
(setq org-latex-minted-options
      '(
	("linenos=true")
;;	("mathescape=true")
;;        ("numbersep=5pt")
;;        ("gobble=2")
        ("frame=lines")
;;        ("framesep=2mm")
	))
(setq org-latex-pdf-process
      '("xelatex -8bit -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; for literate programming
;; you need to install htmlize.el first.
;; syntax highlight your code
;; removes the annoying "Do you want to execute" your code when you type: C-c C-c
(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)
))

(defun melon-osx/post-init-yasnippet ()
  "Initialize yasnippet"
    (progn
      (add-to-list
       'yas-snippet-dirs "~/.spacemacs.d/snippets")
      (yas-global-mode 1)))
;;; packages.el ends here
