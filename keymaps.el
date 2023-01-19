;;; keymaps.el -*- lexical-binding: t; -*-

(setq! which-key-idle-delay 0.2)
(map! "s-}" 'tab-bar-switch-to-next-tab)
(map! "s-{" 'tab-bar-switch-to-prev-tab)

;; Make dired use the same buffer
(map! :map dired-mode-map
      :n "-" (lambda () (interactive) (find-alternate-file ".."))
      :n "RET"  'dired-find-alternate-file)

(define-key evil-insert-state-map
  ( kbd "C-<f12>" ) 'copilot-accept-completion)


(map! "C-," 'embark-act)

;; Unbind doom default for the C-j rebind to work properly
(map! :after evil-org-agenda
      :map evil-org-agenda-mode-map
      :m "C-j" nil)
(define-key evil-normal-state-map
  ( kbd "C-j" ) '+workspace/switch-to)
