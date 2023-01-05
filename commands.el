;;; commands.el -*- lexical-binding: t; -*-

(evil-ex-define-cmd "er" 'eval-region)
(evil-ex-define-cmd "orc" 'org-roam-capture)
(evil-ex-define-cmd "orf" 'org-roam-node-find)
(evil-ex-define-cmd "orl" 'org-insert-link)
(evil-ex-define-cmd "or-attatch" 'org-attach)
(evil-ex-define-cmd "or-archive" 'org-archive-subtree)
(evil-ex-define-cmd "vs" '+evil/window-vsplit-and-follow)
(evil-ex-define-cmd "sp" '+evil/window-split-and-follow)
(evil-ex-define-cmd "term" '+vterm/here)
(evil-ex-define-cmd "tabn" 'tab-new)
(evil-ex-define-cmd "tabc" 'tab-close)
(evil-ex-define-cmd "tabm" 'tab-move-to)
