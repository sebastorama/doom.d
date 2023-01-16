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

;; Org Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((js . t)))

;; Roam Capture Templates
(setq! org-roam-capture-templates
      '(("d" "default" plain "%?"
         :target (file+head "%<%Y%m%d_%H%M>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)))
