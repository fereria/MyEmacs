;;Python

(global-set-key "\M-g"      'goto-line)
(global-set-key "\C-x\C-m"  'apply-macro-to-region-lines)
(global-set-key (kbd "C-c j")   'comment-region)

(define-key python-mode-map (kbd "C-c f") 'py-autopep8)
;;------------------------------------------
;;Gutter
;;------------------------------------------

(global-set-key (kbd "C-x g") 'git-gutter+-mode) ; Turn on/off in the current buffer
(global-set-key (kbd "C-x G") 'global-git-gutter+-mode) ; Turn on/off globally

(eval-after-load 'git-gutter+
  '(progn
     ;;; Jump between hunks
     (define-key git-gutter+-mode-map (kbd "C-x n") 'git-gutter+-next-hunk)
     (define-key git-gutter+-mode-map (kbd "C-x p") 'git-gutter+-previous-hunk)

     ;;; Act on hunks
     (define-key git-gutter+-mode-map (kbd "C-x v =") 'git-gutter+-show-hunk)
     (define-key git-gutter+-mode-map (kbd "C-x r") 'git-gutter+-revert-hunks)
     ;; Stage hunk at point.
     ;; If region is active, stage all hunk lines within the region.
     (define-key git-gutter+-mode-map (kbd "C-x t") 'git-gutter+-stage-hunks)
     (define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
     (define-key git-gutter+-mode-map (kbd "C-x C") 'git-gutter+-stage-and-commit)
     (define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
     (define-key git-gutter+-mode-map (kbd "C-x U") 'git-gutter+-unstage-whole-buffer)))

;;------------------------------------------
;;Helm関係
;;------------------------------------------
(global-set-key (kbd "C-;")   'helm-mini)
(global-set-key (kbd "C-c b") 'helm-descbinds)
(global-set-key (kbd "C-c o") 'helm-occur)
(global-set-key (kbd "C-c s") 'helm-ag)
(global-set-key (kbd "C-c y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c i") 'helm-imenu)
(global-set-key (kbd "C-c d") 'helm-swoop)
;;既存の機能をHelmで置き換え
(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key "\C-xrl"        'helm-bookmarks)
;;------------------------------------------
;;マクロ関係
;;------------------------------------------
;;開始
(define-key global-map [f1] 'start-kbd-macro)
;;終了
(define-key global-map [f2] 'end-kbd-macro)
;;最近のマクロを使う
(define-key global-map [f3] 'call-last-kbd-macro)
;;日付挿入
(define-key global-map [f5]
  '(lambda ()
     (interactive)
     (insert (format-time-string "%Y/%m/%d %H:%M:%S"))))
;;------------------------------------------
;;バッファをアップロード（init読み直し）
(define-key global-map [f8] 'eval-buffer)
;;------------------------------------------
;;置換
;;------------------------------------------
(global-set-key "\C-c\C-o"  'anzu-query-replace-regexp)
(global-set-key "\C-cr"     'anzu-query-replace)
(global-set-key "\C-ct"     'anzu-query-replace-at-cursor-thing)

(global-set-key "\C-cu"     'py-beginning-of-def-or-class)
(global-set-key "\C-cn"     'py-end-of-def-or-class)
(global-set-key "\C-cm"     'py-mark-block)

;;改行コード変更
(global-set-key "\C-c\C-l"     'set-buffer-file-coding-system)

;;------------------------------------------
;;Gistにアップロード
;;------------------------------------------
(global-set-key "\C-cg"     'yagist-region-or-buffer-private)
(global-set-key "\C-cc"     'yagist-region-or-buffer)

(global-set-key "\C-x\C-g"  'magit-status)

;;Window透明度を調整
(global-set-key (kbd "C-7") '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-9") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 40)))))


(global-set-key (kbd "C-c C-e") 'org2blog/wp-new-entry) 
(global-set-key "\C-c\C-h"      'highlight-regexp)
(global-set-key "\C-ch"         'unhighlight-regexp)

;;helmでyasnippet
(global-set-key (kbd "C-c k") 'helm-c-yas-complete)

;;yasnippetの登録
(global-set-key (kbd "C-c n") 'yas-new-snippet)
(global-set-key (kbd "C-c e") 'yas-visit-snippet-file)
(global-set-key (kbd "C-c l") 'yas-expand)

;; ショートカットキー
(global-set-key "\C-c\M-l" 'org-store-link)
(global-set-key "\C-c\M-o" 'org-capture)
(global-set-key "\C-c\M-a" 'org-agenda)
(global-set-key "\C-c\M-b" 'org-iswitchb)
(global-set-key "\C-ca" 'org-agenda)

;;フレームコントロール
(global-set-key (kbd "C-x 7") 'new-frame)
(global-set-key (kbd "C-x 8") 'other-frame)
(global-set-key (kbd "C-x 9") 'delete-frame)

(require 'expand-region)
(global-set-key (kbd "C-{") 'er/expand-region)
(global-set-key (kbd "C-}") 'er/contract-region)

;;DeleteMayaConsole
(global-set-key (kbd "C-'")   'deleteMayaConsole)
(global-set-key (kbd "C-c '") 'delPyConsole)

(global-set-key (kbd "C-c /") 'createInitPy)
(global-set-key (kbd "C-c ]") 'deleteIndention)

(global-set-key "\C-m" 'newline-and-indent)

;;表示しているの以外のバッファを閉じる
(global-set-key (kbd "C-c C-k") 'kill-other-buffers)

;;ハイライトをつける
(global-set-key (kbd "M-[") 'highlight-symbol-at-point)
(global-set-key (kbd "M-]") 'highlight-symbol-remove-all)

;;Maya関係のSC
(add-hook
 'mel-mode-hook
 (lambda ()
   (require 'etom)
   (setq etom-default-host "localhost")
   (setq etom-default-port 2222)
   (local-set-key (kbd "C-c C-r") 'etom-send-region)
   (local-set-key (kbd "C-c C-c") 'etom-send-buffer)
   (local-set-key (kbd "C-c C-l") 'etom-send-buffer)
   (local-set-key (kbd "C-c C-z") 'etom-show-buffer)))

;;Mayaで実行
(add-hook
 'python-mode-hook
 (lambda ()
   (require 'etom)
   (setq etom-default-host "localhost")
   (setq etom-default-port 2222)
   (local-set-key (kbd "C-c C-r") 'etom-send-region-py)
   (local-set-key (kbd "C-c C-l") 'etom-send-buffer-py)))

;;nose
(local-set-key (kbd "C-c C-t") 'elpy-test-nose-runner)

(global-set-key (kbd "<f7>")      'fold-dwim-toggle)
(global-set-key (kbd "<M-f7>")    'fold-dwim-hide-all)
(global-set-key (kbd "<S-M-f7>")  'fold-dwim-show-all)

