;;; hydra.el -*- lexical-binding: t; -*-

(defhydra hydra-window-resize (:timeout 4)
  "resize window"
  ("l" (evil-window-increase-width 3) "width +")
  ("h" (evil-window-decrease-width 3) "width -")
  ("k" (evil-window-increase-height 3) "height +")
  ("j" (evil-window-decrease-height 3) "height -")
  ("f" nil "finished" :exit t))

(map! :leader
      :desc "resize window" "C-r" #'hydra-window-resize/body)
