;; vbnet-mode 読み込み
(require 'vbnet-mode)
(add-to-list 'auto-mode-alist '("\\.bas$" . vbnet-mode)) ; .vbsに関連付け
;; auto-complete の対象にする
(add-to-list 'ac-modes 'vbnet-mode)
;; summarye の一覧対象にする
(add-to-list 'se/mode-delimiter-alist
	     '((vbnet-mode)
	       (("function" "^[ 	]*.*[ 	]*\\([Ss]ub\\|[Ff]unction\\)[ 	]+\\(.*(.*)\\)")
		("class" "^[ 	]*[Cc]lass\\(.*\\)")
		("variable" "^[ 	]*[Dd]im[ 	]+\\(.*\\)"))
	       (lambda (beg end category)
		 (if (equal "function" category)
		 (se/matched-pattern 2)
		 (se/matched-pattern 0))
	       )))
