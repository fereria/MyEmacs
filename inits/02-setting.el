;; �����t�H���_�w��
(cd "i:/dev")

;;�c�[���o�[������
(tool-bar-mode 0)

(setq resize-mini-windows nil)
(fringe-mode 0)
(setq gc-cons-threshold 5242880)

;; �ҏW�� buffer �ēǂݍ���
(global-auto-revert-mode 1)

;; Emacs �̎���� y/n ��
(fset 'yes-or-no-p 'y-or-n-p)

;; �⊮���ɑ啶������������ʂ��Ȃ�
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; �V���{���b�N�����N���J���Ƃ��̎���ȗ�
(setq vc-follow-symlinks t)

;; �X�N���[�����̈ړ��ʂ�1��
(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 1)

;;; ScrollBar �d���̂ŏ���
(scroll-bar-mode -1)

;;; �J�[�\���_�łƂ߂�
(blink-cursor-mode 0)
;; �J�[�\���̈ʒu���������ڂ���\������
(column-number-mode t)
;; �J�[�\���̈ʒu�����s�ڂ���\������
(line-number-mode t)

;; �ʏ�̃E�B���h�E�ōs��܂�Ԃ��Ȃ�
(setq-default truncate-lines t)
;; �E�B���h�E�����E�ɕ��������Ƃ��ɍs��܂�Ԃ��Ȃ�
(setq-default truncate-partial-width-windows t)

;;; �o�b�N�A�b�v�t�@�C�������Ȃ�
(setq make-backup-files nil)
(setq auto-save-default nil)

;; �^�C�g���o�[�Ƀt�@�C���̃t���p�X�\��
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;;����炳�Ȃ�
(setq ring-bell-function 'ignore)

;;�I�[�g�Z�[�u
(require 'auto-save-buffers)
(run-with-idle-timer 5 t 'auto-save-buffers)

;; �Ή����銇�ʂ��n�C���C�g
(show-paren-mode t)

;; ���ʂ̎����⊮
(require 'smartparens-config)
(smartparens-global-mode t)

;; ���ʂ̕⊮
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

(if (not (fboundp 'replace-in-string))
    (defun replace-in-string (string regexp replacement &optional literal)
      "Replace regex in string with replacement"
      (replace-regexp-in-string regexp replacement string t literal)))

;; C-k �P��ōs�S�̂��폜����
(setq kill-whole-line t)

;; �X�^�[�g�A�b�v��\��
(setq inhibit-startup-screen t)

;;�X�v���b�V���X�N���[�����E��
(setq inhibit-startup-screen t)

;;Replace-String�g����Anzu���[�h
(global-anzu-mode +1)

;; �N�����ɃE�B���h�E�ő剻
(defun jbr-init ()
  (interactive)
  (w32-send-sys-command #xf030)
  (ecb-redraw-layout)
  (calendar))

(let ((ws window-system))
  (cond ((eq ws 'w32)
         (set-frame-position (selected-frame) 0 0)
         (setq term-setup-hook 'jbr-init)
         (setq window-setup-hook 'jbr-init))
        ((eq ws 'ns)
         ;; for MacBook Air(Late2010) 11inch display
         (set-frame-position (selected-frame) 0 0)
         (set-frame-size (selected-frame) 95 47))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; witch-fund-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(which-function-mode)

(eval-after-load "which-func"
      '(setq which-func-modes '(java-mode c++-mode org-mode python-mode)))

;; �ҏW�s��ڗ�������i���ݍs���n�C���C�g�\������j
(global-hl-line-mode)

;; �I�����ɃI�[�g�Z�[�u�t�@�C��������
(setq delete-auto-save-files t)

;; for window system
(if window-system 
    (progn
      (set-frame-parameter nil 'alpha 100)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;�ԍ��\��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'linum)
;; (setq linum-format "%5d ")
;; (global-linum-mode t)
;; (setq linum-delay t)
;; (defadvice linum-schedule (around my-linum-schedule () activate)
;;   (run-with-idle-timer 0.2 nil #'linum-update-current))

(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))

(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))

;; (cancel-timer global-hl-line-timer)

