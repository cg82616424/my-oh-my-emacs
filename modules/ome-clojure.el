(ome-install 'clojure-mode)

(defun ome-cider-setup ()
  (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
  (setq nrepl-hide-special-buffers t)
  (setq cider-repl-tab-command 'indent-for-tab-command)
  (setq cider-prefer-local-resources t)
  (setq cider-repl-pop-to-buffer-on-connect nil)
  (setq cider-repl-pop-to-buffer-on-connect nil)
  (setq cider-popup-stacktraces nil)
  (setq cider-repl-popup-stacktraces t)
  (setq cider-auto-select-error-buffer t)
  (setq nrepl-buffer-name-show-port t)
  (setq cider-repl-display-in-current-window t)
  (setq cider-repl-result-prefix ";; => ")
  (setq cider-interactive-eval-result-prefix ";; => ")
  (setq cider-repl-use-clojure-font-lock t)
  (setq cider-test-show-report-on-success t)
  (setq nrepl-hide-special-buffers t)
  (setq nrepl-buffer-name-separator "-")
  (setq nrepl-buffer-name-show-port t)
  ;; repl history
  (setq cider-repl-wrap-history t))

(defun ome-ac-cider-setup ()
  (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
  (add-hook 'cider-mode-hook 'ac-cider-setup)
  (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'cider-repl-mode)))

(when (executable-find "lein")
  (ome-install 'cider)
  (ome-install 'ac-cider))
