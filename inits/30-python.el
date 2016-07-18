(elpy-enable)
    (defun electric-pair ()
      "If at end of line, insert character pair without surrounding spaces.
    Otherwise, just insert the typed character."
      (interactive)
      (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))

(add-hook 'python-mode-hook
           '(lambda ()
              (setq indent-tabs-mode nil);;tabの幅を変える
              (setq indent-level 4)
              (setq python-indent 4)
              (setq tab-width 4)
              (define-key python-mode-map "\"" 'electric-pair) ;;括弧の補完
              (define-key python-mode-map "\'" 'electric-pair)
              (define-key python-mode-map "(" 'electric-pair)
              (define-key python-mode-map "[" 'electric-pair)
              (define-key python-mode-map "{" 'electric-pair)
              (define-key company-active-map (kbd "\C-n") 'company-select-next)
              (define-key company-active-map (kbd "\C-p") 'company-select-previous)
              (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
              (define-key company-active-map (kbd "<tab>") 'company-complete)
              (auto-complete-mode -1)
              ))

;;インデントカラー追加
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(add-hook 'python-mode-hook 'imenu-add-menubar-index)
 (defun my-imenu-rescan ()
   (interactive)
   (imenu--menubar-select imenu--rescan-item))

(require 'fold-dwim)

(add-hook 'python-mode-hook 'hs-minor-mode)

; autopep-8の設定
(require 'py-autopep8)
;; 保存時にバッファ全体を自動整形する
(add-hook 'before-save-hook 'py-autopep8-before-save)
(setq py-autopep8-options '("--max-line-length=160"))
