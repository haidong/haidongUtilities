;; ---------------------------
;; -- Get ido for easy buffer management
;; ---------------------------
(require 'ido)
(ido-mode t)
;; ---------------------------
;; -- Setup MELPA package management
;; ---------------------------
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; ---------------------------
;; -- Install packages I need
;; ---------------------------
(defvar my-packages '(evil smart-tab yasnippet fill-column-indicator)
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

(add-to-list 'hippie-expand-try-functions-list
'yas/hippie-try-expand) ;put yasnippet in hippie-expansion list

(setq smart-tab-using-hippie-expand t)
(global-smart-tab-mode t)

(global-visual-line-mode t)

;; open up Emacs with an empty buffer
(setf inhibit-splash-screen t)
(switch-to-buffer (get-buffer-create "emtpy"))
(delete-other-windows)
