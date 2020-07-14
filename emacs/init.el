;; Need to initialize use-package and org before using org-babel
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)  ;; Install packages if they're not yet installed

(use-package org)


;; Load literate config
(org-babel-load-file "~/.emacs.d/config.org")

(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
