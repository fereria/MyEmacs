(require 'cg-mode)
(add-to-list 'auto-mode-alist '("\\.cgfx\\'" . cg-mode))
(add-to-list 'auto-mode-alist '("\\.cgh\\'"  . cg-mode))

(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
