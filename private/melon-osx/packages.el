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

(defun melon-osx/init-exec-path-from-shell ()
  "Initialize exec-path-from-shell"
  (use-package exec-path-from-shell
    :init
    ;; config
    :config
    (progn
      (when (memq window-system '(mac ns x))
        (exec-path-from-shell-initialize))
      )
    )
)

(defun melon-osx/init-org ()
  "Initilize org"
  (use-package org
	       :init
s	       ;; config
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
		    (R          . t)
		    (plantuml   . t)))
)))
;;; packages.el ends here
