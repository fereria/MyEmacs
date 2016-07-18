;;日本語の設定
(set-language-environment "Japanese")

;; 文字コード
(set-language-environment    'utf-8)
(prefer-coding-system        'utf-8)
(set-keyboard-coding-system  'utf-8)
(setq locale-coding-system   'utf-8)
(setq default-file-name-coding-system 'shift_jis) ;dired文字化け対策

(modify-coding-system-alist 'file "\\.py\\'" 'utf-8)

;;; IME の設定 
(setq default-input-method "W32-IME")
(setq-default w32-ime-mode-line-state-indicator "[--]")
(setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
(w32-ime-initialize) 
(global-set-key [M-kanji] 'ignore)

;;; IME ON/OFF 時にカーソル色を変える。 
(setq ime-activate-cursor-color   "#00a000")
(setq ime-inactivate-cursor-color "#ffa1cf") 
(set-cursor-color ime-inactivate-cursor-color) 

(add-hook 'w32-ime-on-hook 
          (function (lambda () 
                      (set-cursor-color ime-activate-cursor-color)))) 
(add-hook 'w32-ime-off-hook 
          (function (lambda () 
                      (set-cursor-color ime-inactivate-cursor-color)))) 

;; 改行コードを表示
(setq eol-mnemonic-dos  "(CRLF)")
(setq eol-mnemonic-mac  "(CR)")
(setq eol-mnemonic-unix "(LF)")

;(set-default-file-coding-system *euc-japan*dos)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;フォント設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'auto-highlight-symbol-config)

(require 'highlight-symbol)
(setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1" "tomato")) ;; 使いたい色を設定、repeatしてくれる

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;フォント設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-face-attribute 'default nil :family "Consolas" :height 104)
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "MeiryoKe_Console"))
(setq face-font-rescale-alist '(("MeiryoKe_Console" . 1.10)))
