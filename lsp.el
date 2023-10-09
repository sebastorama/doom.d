;;; lsp.el -*- lexical-binding: t; -*-

(after! lsp-ui
  (setq! lsp-ui-doc-enable t))

(add-hook! 'typescript-ts-mode-hook (lsp))
(add-hook! 'tsx-ts-mode-hook (lsp))

;; customize apheleia formatter for prettier-json
(after! apheleia
  (setf (alist-get 'prettier-json apheleia-formatters)
        '("prettier" "--parser" "json")))
