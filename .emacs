(package-initialize)
(pyenv-mode)
(setq ring-bell-function 'ignore)
(setq elpy-rpc-virtualenv-path 'current)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Installed pacakges ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(jedi fill-column-indicator dracula-theme fold-this elpy pyenv-mode))
 '(warning-suppress-types '(((python python-shell-completion-native-turn-on-maybe)))))
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


(defun ssbb-pyenv-hook ()
"Automatically activates pyenv version if .python-version file exists."
(f-traverse-upwards
(lambda (path)
  (let ((pyenv-version-path (f-expand ".python-version" path)))
		(if (f-exists? pyenv-version-path)
				(pyenv-mode-set (s-trim (f-read-text pyenv-version-path 'utf-8))))))))

(add-hook 'find-file-hook 'ssbb-pyenv-hook)

;; Allow moving between windows with Shift + (<-, ->, up, down arrows)
(windmove-default-keybindings)

;(setq elpy-rpc-backend "jedi") ;; for elpy default
;;;(setq-default indent-tabs-mode nil)
;(setq elpy-shell-use-project-root nil)


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
