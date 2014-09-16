;; Change default key-bindings
;;(global-set-key "\C-w" 'backward-kill-word)
;;(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-xg" 'magit-status)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Disable menus
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Change the default color theme
(load-theme 'manoj-dark t)

;; org-mode keybindings
;; The following lines are always needed.  Choose your own keys.
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
          "http://marmalade-repo.org/packages/"))
          (package-initialize)

;; Include key-bindings for evil-nerd-commenter
(evilnc-default-hotkeys)

;; Include smex for most recently used M-x commands
(require 'smex)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; include org-journal
(require 'org-journal)

(setq org-agenda-files (list 
    "~/Organization/Unprocessed.org"
    "~/Organization/Home.org"
    "~/Organization/House.org"
    "~/Organization/Office.org"
    "~/Organization/Philosophy.org"
    "~/Organization/Climbing.org"
    "~/Organization/Daily.org"))

;; include keywiz
(require 'keywiz)

;; include projectile
(projectile-global-mode)

;; use windmove for easy window navigation
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;
;; ace jump mode major function
;; 
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;
;; enable psvn
;;
(add-to-list 'load-path "~/.emacs.d/")
(load "psvn.el")
(require 'psvn)

