;;; spell.el -*- lexical-binding: t; -*-

(setq! ispell-data-dir "~/Library/Spelling/")
(setq! ispell-aspell-dict-dir ispell-aspell-data-dir)
(setq! ispell-aspell-dictionary-alist '())
(add-to-list 'ispell-aspell-dictionary-alist (ispell-aspell-find-dictionary "en_US"))
(add-to-list 'ispell-aspell-dictionary-alist (ispell-aspell-find-dictionary "pt_BR"))

(after! 'ispell
  (setenv "LANG" "en_US")
  (setq! ispell-program-name "hunspell")
  (setq! ispell-dictionary "en_US,pt_BR")
  ;; ispell-set-spellchecker-params has to be called
  ;; ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,pt_BR"))

(remove-hook 'text-mode-hook #'spell-fu-mode)
