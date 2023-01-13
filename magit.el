;;; magit.el -*- lexical-binding: t; -*-

(add-hook! 'magit-mode-hook (lambda () (magit-delta-mode +1)))
