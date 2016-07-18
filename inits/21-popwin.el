(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)

;; sdic-display-buffer 書き換え 
(defadvice sdic-display-buffer (around sdic-display-buffer-normalize activate)
  "sdic のバッファ表示を普通にする。"
  (setq ad-return-value (buffer-size))
  (let ((p (or (ad-get-arg 0)
               (point))))
    (and sdic-warning-hidden-entry
         (> p (point-min))
         (message "この前にもエントリがあります。"))
    (goto-char p)
    (display-buffer (get-buffer sdic-buffer-name))
    (set-window-start (get-buffer-window sdic-buffer-name) p)))

(defadvice sdic-other-window (around sdic-other-normalize activate)
  "sdic のバッファ移動を普通にする。"
  (other-window 1))

(defadvice sdic-close-window (around sdic-close-normalize activate)
  "sdic のバッファクローズを普通にする。"
  (bury-buffer sdic-buffer-name))

;; popwinにするバッファ
;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
(push '("*slime-macroexpansion*") popwin:special-display-config)
(push '("*slime-description*") popwin:special-display-config)
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
(push '("*slime-xref*") popwin:special-display-config)
(push '(sldb-mode :stick t) popwin:special-display-config)
(push '(slime-repl-mode) popwin:special-display-config)
(push '(slime-connection-list-mode) popwin:special-display-config)
(push '("*Kill Ring*") popwin:special-display-config)
(push '("*anything*") popwin:special-display-config)
(push '("*sdic*") popwin:special-display-config)
(push '("*Completions*") popwin:special-display-config)
;(push '("*Maya*") popwin:special-display-config)
(push '("*Python*") popwin:special-display-config)

(defadvice py-execute-buffer (after popwin-python-shell-window activate)
    (popwin:popup-buffer "*Python*"))
(setq py-split-windows-on-execute-p nil)
