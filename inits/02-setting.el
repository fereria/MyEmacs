;; 初期フォルダ指定
(cd "i:/dev")

;;ツールバーを消す
(tool-bar-mode 0)

(setq resize-mini-windows nil)
(fringe-mode 0)
(setq gc-cons-threshold 5242880)

;; 編集時 buffer 再読み込み
(global-auto-revert-mode 1)

;; Emacs の質問を y/n に
(fset 'yes-or-no-p 'y-or-n-p)

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; シンボリックリンクを開くときの質問省略
(setq vc-follow-symlinks t)

;; スクロール時の移動量を1に
(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 1)

;;; ScrollBar 重いので消す
(scroll-bar-mode -1)

;;; カーソル点滅とめる
(blink-cursor-mode 0)
;; カーソルの位置が何文字目かを表示する
(column-number-mode t)
;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 通常のウィンドウで行を折り返さない
(setq-default truncate-lines t)
;; ウィンドウを左右に分割したときに行を折り返さない
(setq-default truncate-partial-width-windows t)

;;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;;音を鳴らさない
(setq ring-bell-function 'ignore)

;;オートセーブ
(require 'auto-save-buffers)
(run-with-idle-timer 5 t 'auto-save-buffers)

;; 対応する括弧をハイライト
(show-paren-mode t)

;; 括弧の自動補完
(require 'smartparens-config)
(smartparens-global-mode t)

;; 括弧の補完
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

(if (not (fboundp 'replace-in-string))
    (defun replace-in-string (string regexp replacement &optional literal)
      "Replace regex in string with replacement"
      (replace-regexp-in-string regexp replacement string t literal)))

;; C-k １回で行全体を削除する
(setq kill-whole-line t)

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;;スプラッシュスクリーンを殺す
(setq inhibit-startup-screen t)

;;Replace-String拡張のAnzuロード
(global-anzu-mode +1)

;; 起動時にウィンドウ最大化
(defun jbr-init ()
  (interactive)
  (w32-send-sys-command #xf030)
  (ecb-redraw-layout)
  (calendar))

(let ((ws window-system))
  (cond ((eq ws 'w32)
         (set-frame-position (selected-frame) 0 0)
         (setq term-setup-hook 'jbr-init)
         (setq window-setup-hook 'jbr-init))
        ((eq ws 'ns)
         ;; for MacBook Air(Late2010) 11inch display
         (set-frame-position (selected-frame) 0 0)
         (set-frame-size (selected-frame) 95 47))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; witch-fund-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(which-function-mode)

(eval-after-load "which-func"
      '(setq which-func-modes '(java-mode c++-mode org-mode python-mode)))

;; 編集行を目立たせる（現在行をハイライト表示する）
(global-hl-line-mode)

;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; for window system
(if window-system 
    (progn
      (set-frame-parameter nil 'alpha 100)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;番号表示
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'linum)
;; (setq linum-format "%5d ")
;; (global-linum-mode t)
;; (setq linum-delay t)
;; (defadvice linum-schedule (around my-linum-schedule () activate)
;;   (run-with-idle-timer 0.2 nil #'linum-update-current))

(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))

(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))

;; (cancel-timer global-hl-line-timer)

