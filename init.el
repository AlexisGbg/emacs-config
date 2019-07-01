;; ---------------------------------------------------
;; Sample emacs config focusing on clojure development
;; ---------------------------------------------------

;; installed packages
;; - exec-path-from-shell (not from stable!)
;; - hl-sexp
;; - paredit
;; - clojure-mode
;; - cider
;; - company
;; - flycheck (not from stable!)
;; - flycheck-clojure
;; - clj-refactor

;; emacs package management
;; use MELPA stable
(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setq package-user-dir (concat user-emacs-directory "elpa"))
(add-to-list 'load-path (concat user-emacs-directory "site-lisp"))

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(setq package-enable-at-startup nil) ; Don't initialize later as well

(package-initialize)

;; show opening, closing parens
(show-paren-mode)

(require-package 'epl)

(require-package 'exec-path-from-shell)

(prefer-coding-system 'utf-8)

;; THEME
(load-theme 'ample-flat t t)
(enable-theme 'ample-flat)


;; ESS
(add-to-list 'load-path "/home/gui0a01a/ess-18.10.2/lisp")
(require 'ess-r-mode)
(global-linum-mode t)




;; PYTHON
;; Set python interpreter
(setq python-shell-interpreter "/home/gui0a01a/kaggle/kaggleenv/bin/python3.6")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (elpy python-x exec-path-from-shell epl))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Custom Python block executor
(defun exec-python-block ()
  (interactive)
  (beginning-of-line)
  (call-interactively 'set-mark-command)
  (end-of-line)
  (re-search-forward "^[a-z-A-Z]\\|\\'")
  (previous-line)
  (end-of-line)
  (call-interactively 'python-shell-send-region)
  (next-line)
  (deactivate-mark)
  (message "Block Executed")
  )

(defun add-python-key ()
  (local-set-key (kbd "C-c r") 'exec-python-block))

(add-hook 'python-mode-hook 'add-python-key)

;; Python
;;(global-set-key "\C-cb" 'mp-display-message)
;;)
