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
(defvar my-packages '(evil)
    "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
    (when (not (package-installed-p p))
          (package-install p)))

;; ---------------------------
;; -- Config packages I need
;; ---------------------------

(require 'evil)
(evil-mode 1)
;; Make evil treat underscore as part of a word
(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol)
    ;; make evil-search-word look for symbol rather than word boundaries
    (setq-default evil-symbol-word-search t))

(setq column-number-mode t)
;; org config
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "ToDo.org"))
(setq org-archive-location "%s_archive::datetree/")

(setq org-capture-templates
            '(("n" "Notes" entry (file+datetree
				   "~/cloud/HaidongPlanning/Notes.org")
	       "* %^{Description} %^g %?
	       Added: %U")

	    ("t" "ToDo List" entry (file+datetree
				     "~/cloud/HaidongPlanning/ToDo.org")
	     "* TODO %^{Description}  %^g
	    %?
	    Added: %U")
	    ))

(setq org-duration-format 'h:mm)

;; open up Emacs with an empty buffer
(setf inhibit-splash-screen t)
(switch-to-buffer (get-buffer-create "emtpy"))
(delete-other-windows)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(format-all magit evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(find-file "~/cloud/HaidongPlanning/ToDo.org")
(tool-bar-mode -1)
(global-visual-line-mode t)
