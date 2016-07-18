;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;ƒ}ƒNƒ‚ğ•Û‘¶
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'move-after10
   "\C-n\C-n\C-n\C-n\C-n\C-n\C-n\C-n\C-n\C-n")

(fset 'move-before10
   "\C-p\C-p\C-p\C-p\C-p\C-p\C-p\C-p\C-p\C-p")

(fset 'deleteIncrementLine
   [?\C-e ?\C-  ?\C-n ?\C-a ?\C-a ?\C-w ?\C-e])

(fset 'newlinenoindent
   [return ?\C-a ?\C-  ?\C-e ?\C-w])

(fset 'deleteMayaConsole
   [?\C-x ?o ?\C-x ?k return ?\C-x ?0])

(fset 'createInitPy
   [?\C-x ?\C-f ?_ ?_ ?i ?n ?i ?t ?_ ?_ ?. ?p ?y return])

(fset 'deleteIndention
   [?\C-e ?\C-  ?\C-  ?\C-n ?\C-n ?\C-a ?\C-a ?\C-a ?\C-w ?\C-w])

(fset 'delPyConsole
   [?\C-x ?o ?\C-x ?k return ?y ?\C-x ?0])

(fset 'addPyComment
   [?\" ?\" ?\" return ?\C-p ?\C-e return])




