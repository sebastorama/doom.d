;;; lsp.el -*- lexical-binding: t; -*-

(after! lsp-ui
  (setq! lsp-ui-doc-enable t))

(add-hook! 'typescript-ts-mode-hook (lsp))
(add-hook! 'tsx-ts-mode-hook (lsp))
