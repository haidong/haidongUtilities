(add-to-list 'load-path "~/.emacs.d/elpa")
(require 'ido)
(ido-mode t)

;; ---------------------------
;; -- Setup MELPA package management
;; ---------------------------
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; ---------------------------
;; -- Install packages I need
;; ---------------------------
(defvar my-packages '(evil smart-tab yasnippet org-pomodoro)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; ---------------------------
;; -- Config packages I need
;; ---------------------------

(require 'evil)
(evil-mode 1)

(require 'smart-tab)
(require 'yasnippet)

;; org config
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "life.org"))

(require 'org-pomodoro)
(setq org-pomodoro-audio-player "sounder.exe")
(setq org-pomodoro-play-sounds t)
(defun toggle-pomodoro-ticking-sound ()
  (interactive)
  (if org-pomodoro-play-ticking-sounds
    (setq org-pomodoro-play-ticking-sounds 'nil)
    (setq org-pomodoro-play-ticking-sounds t)))
(defun mp-add-pomodoro-ticking-toggle ()
  (local-set-key (kbd "<f11>") 'toggle-pomodoro-ticking-sound))
(defun mp-add-pomodoro-start-key ()
  (local-set-key (kbd "<f12>") 'org-pomodoro))
(add-hook 'org-mode-hook 'mp-add-pomodoro-start-key)
(add-hook 'org-mode-hook 'mp-add-pomodoro-ticking-toggle)


(add-to-list 'hippie-expand-try-functions-list
'yas/hippie-try-expand) ;put yasnippet in hippie-expansion list

(setq smart-tab-using-hippie-expand t)
(global-smart-tab-mode t)

(global-visual-line-mode t)
(setq w3m-display-inline-images t)

(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

;; open up Emacs with an empty buffer
(setf inhibit-splash-screen t)
(switch-to-buffer (get-buffer-create "emtpy"))
(delete-other-windows)
