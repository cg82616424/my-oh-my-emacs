;; show column number and line number
(dolist (mode '(column-number-mode line-number-mode))
  (when (fboundp mode) (funcall mode t)))

(dolist (mode-hook '(text-mode-hook prog-mode-hook conf-mode-hook))
  (add-hook mode-hook
            (lambda ()
              (linum-mode 1))))

;; make the fringe thinner (default is 8 in pixels)
(fringe-mode 4)

;; show parenthesis match
(show-paren-mode 1)
(setq show-paren-style 'expression)

;; Toggle line highlighting in all buffers
(global-hl-line-mode t)

;; frame font
;; Setting English Font
(if (member "Monaco" (font-family-list))
    (set-face-attribute
     'default nil :font "Monaco 12"))

;; http://www.emacswiki.org/emacs/FullScreen
(defun ome-toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

;; (global-set-key (kbd "<f11>") 'ome-toggle-fullscreen)

(defadvice load-theme (around ome-load-theme disable)
  ad-do-it

  ;; Remove boxes from Powerline arrows
  (set-face-attribute 'mode-line nil :box nil)
  (set-face-attribute 'mode-line-inactive nil :box nil))

(defun ome-solarized-emacs-setup ()
  ;; make the fringe stand out from the background
  (setq solarized-distinct-fringe-background t)
  ;; make the modeline high contrast
  (setq solarized-high-contrast-mode-line t)
  ;; Use less bolding
  (setq solarized-use-less-bold t)
  ;; Use more italics
  (setq solarized-use-more-italic t)
  ;; Use less colors for indicators such as git:gutter, flycheck and similar.
  (setq solarized-emphasize-indicators nil)

  (setq x-underline-at-descent-line t)

  (ad-enable-advice 'load-theme 'around 'ome-load-theme)
  (ad-activate 'load-theme)

  (load-theme 'solarized-dark t))

(ome-install 'solarized-emacs)

(defun ome-emacs-powerline-setup ())

(ome-install 'emacs-powerline)

(defun ome-linum-relative-setup ()
  (require 'linum-relative))

(ome-install 'linum-relative)
