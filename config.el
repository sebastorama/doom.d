;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(load-file "~/.config/doom/commands.el")
(load-file "~/.config/doom/org.el")
(load-file "~/.config/doom/keymaps.el")
(load-file "~/.config/doom/hydra.el")
(load-file "~/.config/doom/lsp.el")
(load-file "~/.config/doom/options.el")

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq! user-full-name "Sebastião Giacheto Ferreira Júnior"
       user-mail-address "sebastorama@gmail.com")

(setq! doom-font-increment 1)
(setq! doom-font
       (font-spec :family "Iosevka Nerd Font Mono" :size 15 :weight 'medium))
;; (setq! doom-unicode-font (font-spec :family "JetBrainsMono Nerd Font" :size 14 :weight 'medium))

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq! doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq! display-line-numbers-type 'relative)

;; Give something to grab when resizing
(window-divider-mode)
(setq! window-divider-default-right-width 15)
(setq! window-divider-default-bottom-width 15)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; accept completion from copilot and fallback to company
(use-package! copilot :hook (prog-mode . copilot-mode))

;; Make sure that TypeScript files only get formatted once, with eslint when present.
(setq-hook! 'typescript-ts-mode-hook +format-with-lsp nil)
(setq-hook! 'tsx-ts-mode-hook +format-with-lsp nil)

(defun my/eslint-format ()
  (interactive
   (if-let ((eslint (-first (lambda (wks)
                              (eq 'eslint (lsp--client-server-id
                                           (lsp--workspace-client wks))))
                            (lsp-workspaces))))
       (with-lsp-workspace eslint
                           (lsp-format-buffer))
     (lsp-format-buffer))))

(add-hook! 'typescript-ts-mode-hook
  (lambda () (add-hook 'before-save-hook 'my/eslint-format nil 'local)))

(setq auto-mode-alist (rassq-delete-all 'typescript-mode auto-mode-alist))
(setq auto-mode-alist (rassq-delete-all 'typescript-tsx-mode auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(setq! ispell-data-dir "~/ispell")
;; (setq! ispell-aspell-dict-dir ispell-aspell-data-dir)
;; (setq! ispell-aspell-dictionary-alist '())
;; (add-to-list 'ispell-aspell-dictionary-alist (ispell-aspell-find-dictionary "en_US"))
;; (add-to-list 'ispell-aspell-dictionary-alist (ispell-aspell-find-dictionary "pt_BR"))

(remove-hook 'text-mode-hook #'spell-fu-mode)

(setq! completion-styles '(flex))

(setenv "XMODIFIERS" "")

(with-eval-after-load "ispell"
  (setenv "LANG" "en_US")
  (setq! ispell-program-name "hunspell")
  (setq! ispell-dictionary "en_US,pt_BR")
  ;; ispell-set-spellchecker-params has to be called
  ;; ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,pt_BR"))
