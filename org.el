;;; org.el -*- lexical-binding: t; -*-

(setq! org-directory "~/org/")

;; Everything is an agenda file
(setq! org-agenda-files '("~/org"))

;; Org-roam
(setq! org-roam-directory (file-truename "~/org/"))
(setq! org-roam-dailies-directory "daily/")


;; Org superstar
(setq! org-superstar-special-todo-items nil)
(add-hook! 'org-mode-hook (lambda ()
                            (org-superstar-mode 1)))
