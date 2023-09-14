;;; keymaps.el -*- lexical-binding: t; -*-

(setq! which-key-idle-delay 0.2)
(map! "s-}" 'tab-bar-switch-to-next-tab)
(map! "s-{" 'tab-bar-switch-to-prev-tab)

(map! "<backtab>" 'copilot-accept-completion)
;; Make dired use the same buffer
(map! :map dired-mode-map
      :n "-" (lambda () (interactive) (find-alternate-file ".."))
      :n "RET"  'dired-find-alternate-file)

(map! "C-," 'embark-act)

;; Projectile mappings
(map! "C-c p f" 'projectile-find-file)
(map! "C-c p p" 'projectile-switch-project)
(map! "C-c p r" 'projectile-recentf)
