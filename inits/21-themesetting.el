;; theme path
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;テンプレート
(require 'color-theme)
(require 'powerline)
(require 'moe-theme)

(load-theme 'moe-dark t)
(moe-theme-set-color 'orange)

(setq moe-theme-resize-markdown-title '(2.0 1.7 1.5 1.3 1.0 1.0))
(setq moe-theme-resize-org-title '(2.2 1.8 1.6 1.4 1.2 1.0 1.0 1.0 1.0))
(setq moe-theme-resize-rst-title '(2.0 1.7 1.5 1.3 1.1 1.0))

(powerline-moe-theme)
