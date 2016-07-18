(autoload 'mel-mode "mel-mode"
"Major mode for editing Mel scripts" t)
(setq auto-mode-alist 
      (append '(("\\.mel$" . mel-mode) 
                ) auto-mode-alist))
