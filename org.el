;;; org.el -*- lexical-binding: t; -*-

(setq! org-directory "~/org/")

;; Everything is an agenda file
(setq! org-agenda-files '("~/org"))

(after! org
  (setq! org-agenda-span 20)
  (setq! org-agenda-files (directory-files-recursively "~/org/" "agenda.org$")))


;; Org-roam
(setq! org-roam-directory (file-truename "~/org/"))
(setq! org-roam-dailies-directory "daily/")


;; Org superstar
(setq! org-superstar-special-todo-items nil)
(add-hook! 'org-mode-hook (lambda ()
                            (org-superstar-mode 1)))

;; Org Agenda Customizations
(setq! org-agenda-scheduled-leaders '("xd" "xd.%2x."))

;; Org Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)))
