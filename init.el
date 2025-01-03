;; Package Management
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; I use manateelazycat/auto-save from github
(add-to-list 'load-path "~/.emacs.d/other-packages/auto-save")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'zenburn t)
(require 'auto-save)
(auto-save-enable)

(setq auto-save-silent t)   ; quietly save
(setq auto-save-delete-trailing-whitespace t)  ; automatically delete spaces at the end of the line when saving

(setq make-backup-files nil)

;; Auto-save Configuration
(setq auto-save-disable-predicates
      '((lambda ()
          (string-suffix-p
           "gpg"
           (file-name-extension (buffer-name)) t))))

;; Evil Mode (Vim Emulation)
(use-package evil
  :init
  (setq evil-want-C-i-jump nil) ; Fix tab folding in org-mode
  :config
  (evil-mode 1)
  ;; Make underscore part of word
  (defalias #'forward-evil-word #'forward-evil-symbol)
  ;; Use symbol boundaries for word search
  (setq-default evil-symbol-word-search t))
(use-package ivy
  :config
  (ivy-mode 1))
;; Org Mode Configuration
(use-package org
  :mode (("\\.org$" . org-mode))
  :config
  (setq org-log-done t
        org-agenda-files (list "WorkToDo.org")
        org-archive-location "%s_archive::datetree/"
        org-duration-format 'h:mm))
(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/Sync/orgmode/org-roam"))
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:40} " (propertize "${tags:*}" 'face 'org-tag)))
  (org-roam-db-autosync-mode))

(use-package format-all
  :config
  (add-hook 'prog-mode-hook #'format-all-ensure-formatter))

(use-package yasnippet
  :config
  (yas-global-mode 1))
;;(require 'lsp-bridge)
;;(global-lsp-bridge-mode)
(use-package magit)
(use-package posframe)
(use-package markdown-mode)

;;(setq lsp-bridge-enable-log t)

(setq column-number-mode t)
(setf inhibit-splash-screen t)
(delete-other-windows)
(global-visual-line-mode t)
(tool-bar-mode -1)
(add-hook 'c-mode-hook 'outline-minor-mode)
(add-hook 'c++-mode-hook 'outline-minor-mode)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cf" 'format-all-buffer)
(find-file "~/Sync/orgmode/WorkToDo.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/Sync/orgmode/WorkToDo.org"))
 '(package-selected-packages '(org-roam evil use-package)))
(custom-set-faces
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
