;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Helmの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-config)
(require 'helm-ag)
(require 'helm-descbinds)
(require 'helm-projectile)
(require 'helm-etags+)
(require 'helm-files)

;;まとめて編集
(require 'all-ext)
;;helmでGotoAnything
(require 'anything-startup)
(require 'cl)
(require 'helm-config)
(require 'helm-files)

;;HelmでDired
(defvar my/helm-c-current-directory-source
  `((name . "Current Directory Files")
    (candidates . (lambda ()
                    (with-helm-current-buffer
                      (let ((dirs (directory-files (helm-c-current-directory)))
                            (filter (lambda (d) (string-match "^\.\.?$" d))))
                        (remove-if filter dirs)))))
    (type . file)))

(defun my/helm-find-file-current-directory ()
  (interactive)
  (let ((curbuf (current-buffer))
        (orig-major major-mode))
    (if (helm-other-buffer 'my/helm-c-current-directory-source "*helm-dired*")
        (and (eq orig-major 'dired-mode) (kill-buffer curbuf)))))


(helm-descbinds-mode)

; agのデフォルトのコマンドオプションを指定
; -nを消すとサブディレクトリも再帰的に検索します
(setq helm-ag-base-command "ag --nocolor --nogroup -n")
