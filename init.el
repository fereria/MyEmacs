(setq load-path
      (append
       (list
       (expand-file-name "~/.emacs.d/site-lisp")
       )
       load-path))

(require 'package)
(fset 'package-desc-vers 'package--ac-desc-version)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
(setq init-loader-show-log-after-init t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-yasnippet)))
 '(elpy-test-nose-runner-command (quote ("nosetests" "-v" "-s")))
 '(elpy-test-runner (quote elpy-test-nose-runner)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:background "firebrick1" :foreground "black"))))
 '(flymake-warnline ((t (:background "orange" :foreground "black")))))
