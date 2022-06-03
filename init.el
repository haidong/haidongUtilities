(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/other-packages/lsp-bridge")
(add-to-list 'load-path "~/.emacs.d/other-packages/auto-save")
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(require 'auto-save)
(auto-save-enable)

(setq auto-save-silent t)   ; quietly save
(setq auto-save-delete-trailing-whitespace t)  ; automatically delete spaces at the end of the line when saving

(setq make-backup-files nil)

;;; custom predicates if you don't want auto save.
;;; disable auto save mode when current filetype is an gpg file.
(setq auto-save-disable-predicates
      '((lambda ()
	  (string-suffix-p
	   "gpg"
	   (file-name-extension (buffer-name)) t))))

(use-package evil
  :init
  ;; The following line is to enable proper tab folding and unfolding
  ;; for org files. It worked fine without it for a while, but not lately
  ;; https://stackoverflow.com/questions/22878668/emacs-org-mode-evil-mode-tab-key-not-working
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  ;; Make underscore as part of word.
  (defalias #'forward-evil-word #'forward-evil-symbol)
  ;; make evil-search-word look for symbol rather than word boundaries
  (setq-default evil-symbol-word-search t)
  )
(use-package ivy
  :config
  (ivy-mode 1))
(use-package org
  :mode (("\\.org$" . org-mode))
  :config
  (progn
    (setq org-log-done t)
    (setq org-agenda-files (list "ToDo.org"))
    (setq org-archive-location "%s_archive::datetree/")
    (setq org-duration-format 'h:mm)
    ))
(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/cloud/org-roam"))
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

(use-package corfu)
(use-package corfu-info)
(use-package corfu-history)
(require 'lsp-bridge)
(require 'lsp-bridge-jdtls)       ;; provide Java third-party library jump and -data directory support, optional
(setq lsp-bridge-completion-provider 'corfu)
(require 'lsp-bridge-icon)
(require 'lsp-bridge-orderless)
(global-corfu-mode)
(corfu-history-mode t)
(global-lsp-bridge-mode)
(use-package magit)
(use-package posframe)
(use-package yasnippet
  :config
  (yas-global-mode 1))

;;(setq lsp-bridge-enable-log t)

(setq column-number-mode t)
(setf inhibit-splash-screen t)
(delete-other-windows)
(global-visual-line-mode t)
(add-hook 'c-mode-hook 'outline-minor-mode)
(add-hook 'c++-mode-hook 'outline-minor-mode)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cf" 'format-all-buffer)
(find-file "~/cloud/HaidongPlanning/ToDo.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/cloud/HaidongPlanning/ToDo.org"))
 '(package-selected-packages '(org-roam evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
