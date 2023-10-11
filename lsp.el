;;; lsp.el -*- lexical-binding: t; -*-

(after! lsp-ui
  (setq! lsp-ui-doc-enable t))

(add-hook! 'typescript-ts-mode-hook (lsp))
(add-hook! 'tsx-ts-mode-hook (lsp))

;; customize apheleia formatter for prettier-json
(after! apheleia
  (setf (alist-get 'prettier-json apheleia-formatters)
        '("prettier" "--parser" "json")))

(setq auto-mode-alist (rassq-delete-all 'typescript-mode auto-mode-alist))
(setq auto-mode-alist (rassq-delete-all 'typescript-tsx-mode auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))
