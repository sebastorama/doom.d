;;; keymaps.el -*- lexical-binding: t; -*-

(setq! which-key-idle-delay 0.2)
(map! "s-}" 'tab-bar-switch-to-next-tab)
(map! "s-{" 'tab-bar-switch-to-prev-tab)

(map! "s-i" 'copilot-accept-completion)
;; Make dired use the same buffer
(map! :map dired-mode-map
      :n "-" (lambda () (interactive) (find-alternate-file ".."))
      :n "RET"  'dired-find-alternate-file)

(map! "C-," 'embark-act)

;; My preference for splits
(map! "C-x 2" '+evil/window-split-and-follow)
(map! "C-x 3" '+evil/window-vsplit-and-follow)

;; Projectile mappings
(map! "C-c p f" 'projectile-find-file)
(map! "C-c p p" 'projectile-switch-project)
(map! "C-c p r" 'projectile-recentf)

;; Frame management
(map! "C-c F n" 'make-frame-command)
(map! "C-c F d" 'delete-frame)
(map! "C-c F o" 'other-frame)
(map! "C-c F c" 'clone-frame)
(map! "C-c F <RET>" 'select-frame-by-name)
(map! "C-c F r" 'set-frame-name)

;; Open terminal
(map! "C-c t" '+vterm/here)

;; ORG (roam) mode
(map! "C-c o i" 'org-roam-node-insert)
(map! "C-c o o" 'org-roam-node-find)
(map! "C-c o I" 'org-id-get-create)

;; Agenda
(map! "C-c a a" 'org-agenda)

;; Embark
(defvar-keymap embark-file-map
  :doc "Embark File Map"
  :parent embark-general-map
  "V" #'find-file-other-window
  "T" #'find-file-other-tab)

(defvar-keymap embark-buffer-map
  :doc "Embark Buffer Map"
  :parent embark-general-map
  "V" #'switch-to-buffer-other-window
  "T" #'switch-to-bufer-other-tab)

(defvar-keymap embark-)

;; My redefinitions
(map! "C-x C-b" 'ibuffer)
