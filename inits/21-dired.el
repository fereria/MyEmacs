(add-hook 'dired-load-hook
  '(lambda ()
    ;; ディレクトリを再帰的にコピー可能にする
    (setq dired-recursive-copies 'always)
    ;; ディレクトリを再帰的に削除可能にする(使用する場合は注意)
    ;(setq dired-recursive-deletes 'always)
    ;; lsのオプション 「l」(小文字のエル)は必須
    ;(setq dired-listing-switches "-Flha") ; 「.」と「..」が必要な場合
    ;(setq dired-listing-switches "-GFlhA") ; グループ表示が不要な場合
    (setq dired-listing-switches "-FlhA")
    ;; find-dired/find-grep-diredで、条件に合ったファイルをリストする形式
    (setq find-ls-option '("-print0 | xargs -0 ls -Flhatd"))
    ;; 無効コマンドdired-find-alternate-fileを有効にする
    (put 'dired-find-alternate-file 'disabled nil)
  )
)
;; ファイル・ディレクトリ名のリストを編集することで、まとめてリネーム可能にする
(require 'wdired)
;; wdiredモードに入るキー(下の例では「r」)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;; 新規バッファを作らずにディレクトリを開く(デフォルトは「a」)
;(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 「a」を押したときに新規バッファを作って開くようにする
;(define-key dired-mode-map "a" 'dired-advertised-find-file)
;; 「^」がを押しにくい場合「c」でも上の階層に移動できるようにする
;(define-key dired-mode-map "c" 'dired-up-directory)

;pycを表示しない
(setq dired-omit-mode t)
(setq dired-omit-files "^\\.[^.]\\|\\.buk$\\|\\.pyc$")

;;sort拡張
(defvar dired-various-sort-type
  '(("S" . "size")
    ("X" . "extension")
    ("v" . "version")
    ("t" . "date")
    (""  . "name")))

(defun dired-various-sort-change (sort-type-alist &optional prior-pair)
  (when (eq major-mode 'dired-mode)
    (let* (case-fold-search
           get-next
           (options
            (mapconcat 'car sort-type-alist ""))
           (opt-desc-pair
            (or prior-pair
                (catch 'found
                  (dolist (pair sort-type-alist)
                    (when get-next
                      (throw 'found pair))
                    (setq get-next (string-match (car pair) dired-actual-switches)))
                  (car sort-type-alist)))))
      (setq dired-actual-switches
            (concat "-l" (dired-replace-in-string (concat "[l" options "-]")
                                                  ""
                                                  dired-actual-switches)
                    (car opt-desc-pair)))
      (setq mode-name
            (concat "Dired by " (cdr opt-desc-pair)))
      (force-mode-line-update)
      (revert-buffer))))

(defun dired-various-sort-change-or-edit (&optional arg)
  "Hehe"
  (interactive "P")
  (when dired-sort-inhibit
    (error "Cannot sort this dired buffer"))
  (if arg
      (dired-sort-other
       (read-string "ls switches (must contain -l): " dired-actual-switches))
    (dired-various-sort-change dired-various-sort-type)))

(defvar anything-c-source-dired-various-sort
  '((name . "Dired various sort type")
    (candidates . (lambda ()
                    (mapcar (lambda (x)
                              (cons (concat (cdr x) " (" (car x) ")") x))
                            dired-various-sort-type)))
    (action . (("Set sort type" . (lambda (candidate)
                                    (dired-various-sort-change dired-various-sort-type candidate)))))
    ))

(add-hook 'dired-mode-hook
          '(lambda ()
             (define-key dired-mode-map "s" 'dired-various-sort-change-or-edit)
             (define-key dired-mode-map "c"
               '(lambda ()
                  (interactive)
                  (anything '(anything-c-source-dired-various-sort))))
             ))
