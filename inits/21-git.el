;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq ad-redefinition-action 'accept)
(require 'yagist)
(require 'magit)
(require 'gist)
;;Gistいじる用
(setq yagist-encrypt-risky-config t)
(setq yagist-github-token "<github-token>")
(setenv "GIT_ASKPASS" "git-gui--askpass")

(global-git-gutter+-mode)
