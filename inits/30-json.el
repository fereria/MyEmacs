(require 'json-reformat)
(require 'json-mode)

(setq auto-mode-alist 
      (append '(("\\.json$" . json-mode) 
                ) auto-mode-alist))
