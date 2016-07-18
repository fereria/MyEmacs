(require 'simplenote2)
(setq simplenote2-email "<simplenote-email>")
(setq simplenote2-password "<simple-note-password>")

(add-hook 'simplenote2-create-note-hook
      (lambda ()
        (simplenote2-set-markdown)
        (simplenote2-add-tag "tag1")))

(add-hook 'simplenote2-note-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-t") 'simplenote2-add-tag)
            (local-set-key (kbd "C-c C-c") 'simplenote2-push-buffer)
            (local-set-key (kbd "C-c C-d") 'simplenote2-pull-buffer)
	    (markdown-mode)))

(simplenote2-setup)

(local-set-key (kbd "C-c C-n") 'simplenote2-browse)
