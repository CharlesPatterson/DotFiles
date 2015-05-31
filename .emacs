(require 'cl)

;;
;; Download default-packages if they're not installed
;;

(require 'package)

;; Initialise packages
(package-initialize)

;; Add marmalade to the available repos
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")
	     '("melpa" . "http://melpa.org/packages/"))

;; Define a list of packages to be installed (Taken from Bozhidar Batsov)
;; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/

(defvar default-packages
  '(org
    org-journal
    smex
    yasnippet
    )
  " A list of default packages that are installed at launch.")

(defun packages-installed-p ()
  "Check if all packages in 'default-packages' are installed"
  (every #'package-installed-p default-packages))
 
(unless (packages-installed-p)
  ;;check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p default-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;;
;; Disable menubar and startup splash
;;

(setq inhibit-startup-message t)
(menu-bar-mode -1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'junio t)
