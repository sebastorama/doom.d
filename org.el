;;; org.el -*- lexical-binding: t; -*-

(setq! org-directory "~/org/")

;; Everything is an agenda file
(setq! org-agenda-files '("~/org"))

(after! org
  (setq! org-agenda-span 20))


;; Org-roam
(setq! org-roam-directory (file-truename "~/org/"))
(setq! org-roam-dailies-directory "daily/")


;; Org superstar
(setq! org-superstar-special-todo-items nil)
(add-hook! 'org-mode-hook (lambda ()
                            (org-superstar-mode 1)))

;; Org Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)))
