;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; スニペット設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(require 'helm-c-yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets" ;; 作成するスニペットはここに入る
        ))

(defun yas/indent-snippet ()
  (indent-region yas/snippet-beg yas/snippet-end)
  (indent-according-to-mode))
(add-hook 'yas/after-exit-snippet-hook 'yas/indent-snippet)

(yas-global-mode 1)
(setq yas/indent-line 'fixed)
