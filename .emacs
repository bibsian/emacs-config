;;Melpa repo

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(setq ring-bell-function 'ignore)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Installed pacakges ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (jedi fill-column-indicator dracula-theme fold-this elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;;;;;;;;;;;;;;;;
;;; Enabled ;;;;;
;;;;;;;;;;;;;;;;;
(elpy-enable)

;; Allow moving between windows with Shift + (<-, ->, up, down arrows)
(windmove-default-keybindings)


(setq elpy-rpc-backend "jedi") ;; for elpy default
;;;(setq-default indent-tabs-mode nil)
(setq elpy-shell-use-project-root nil)


(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))


;;---------------------------------------------
;; this portion provide the line limit indicator
;;-----------------------------------------------
(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
  '(lambda() (set-fill-column 72)))


;----------------------;
;;; Dracula dark theme;;
;----------------------;

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)
