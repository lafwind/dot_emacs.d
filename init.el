(require 'package)

;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))

;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; melpa
(add-to-list 'package-archives
              '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
   ;; For important compatibility libraries like cl-lib
   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; hide bar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; Set colortheme: molokai -> from https://github.com/hbin/molokai-theme
;; (require 'emacs-color-themes)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'brin t)

;; (load-theme 'ample t)
;;(enable-theme 'ample)
;;(load-theme 'monokai t)
;; (load-theme 'molokai t)
;; (setq molokai-theme-kit t)

;;指针颜色
(set-cursor-color "white")

;;鼠标颜色
(set-mouse-color "white")

;; 显示行列号
;; (setq column-number-mode t)
(setq line-number-mode t)
(column-number-mode t)     ;在模式行上显示行号列号

;; 初始宽高
(add-to-list 'default-frame-alist '(height . 36))
(add-to-list 'default-frame-alist '(width . 86))

;;显示行号
(global-linum-mode t)

(fset 'yes-or-no-p 'y-or-n-p)      ;Treat 'y' as yes, 'n' as no.

(setq default-directory "~/projects/")  ;寻找文件的默认路径


(setq inhibit-splash-screen t)
;;(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)  ;不生成#file_name#临时文件


;;font
;;(set-default-font "Monaco-11")
;;(set-default-font "Source Code Pro-10.9")
(set-default-font "Anonymous Pro-10.9")

(add-hook 'after-init-hook 'global-company-mode)

(require 'smartparens-config)
(smartparens-global-mode t)

(require 'multiple-cursors)
(multiple-cursors-mode t)

(require 'ido)
(ido-mode t)


;;; Robe

(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" default)))
 '(package-selected-packages
   (quote
    (ample-theme color-theme-sanityinc-tomorrow sublime-themes evil-nerd-commenter smartparens robe rinari multiple-cursors markdown-mode magit js2-mode company-inf-ruby))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
