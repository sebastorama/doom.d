;;; typescript.el -*- lexical-binding: t; -*-

;; Make sure that TypeScript files only get formatted once, with eslint when present.
(defun my/eslint-format ()
  (interactive
   (if-let ((eslint (-first (lambda (wks)
                              (eq 'eslint (lsp--client-server-id
                                           (lsp--workspace-client wks))))
                            (lsp-workspaces))))
       (with-lsp-workspace eslint
         (lsp-format-buffer))
     (lsp-format-buffer))))

(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)

(add-hook! 'typescript-mode-hook
  (lambda ()
    (add-hook 'before-save-hook 'my/eslint-format nil 'local)
    (setq! tab-width 2)))
(add-hook! 'typescript-mode-hook 'tree-sitter-hl-mode)
