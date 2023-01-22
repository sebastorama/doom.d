(setq! company-idle-delay 0.1)

;; Give something to grab when resizing
(window-divider-mode)
(setq! window-divider-default-right-width 15)
(setq! window-divider-default-bottom-width 15)

;; vertico matching using fuzzy 'flex'
(with-eval-after-load 'vertico
  (setq! completion-styles '(flex)))
