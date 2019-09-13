(add-to-list 'load-path "/Users/andrew.bibian/.emacs.d/settings")
(require 'fold-this)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (jedi fold-this ## moe-theme color-theme elpy)))
 '(ring-bell-function (quote ignore)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Allow moving between windows with Shift + (<-, ->, up, down arrows)
(windmove-default-keybindings)

;;
(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; ----
;; Melpa repo
;; -----
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;;--------------------------------------
;; Elpy config
;;--------------------------------------

(package-initialize)
(elpy-enable)
(setq elpy-rpc-backend "jedi") ;; for elpy default
(setq-default indent-tabs-mode nil)
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
;;; Windows & Frames ;;;
;----------------------;
; language
(setq current-language-environment "English")

; don't show the startup screen
(setq inhibit-startup-screen t)
; don't show the menu bar
(menu-bar-mode nil)

; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode -1)

; number of characters until the fill column
(setq fill-column 70)

; specify the fringe width for windows -- this sets both the left and
; right fringes to 10
(require 'fringe)
(fringe-mode 10)


;----------------------;
;;; Dracula dark theme;;
;----------------------;

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)


