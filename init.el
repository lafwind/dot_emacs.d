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

(load-theme 'subatomic t)

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
(add-to-list 'default-frame-alist '(width . 80))

;;显示行号
(global-linum-mode t)

(fset 'yes-or-no-p 'y-or-n-p)      ;Treat 'y' as yes, 'n' as no.

(setq default-directory "~/projects/")  ;寻找文件的默认路径


(setq inhibit-splash-screen t)
;;(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)  ;不生成#file_name#临时文件


;; font
;; (set-default-font "Monaco-11")
;; (set-default-font "Source Code Pro-10.9")
(set-default-font "Anonymous Pro-10.9")

(add-hook 'after-init-hook 'global-company-mode)

(require 'smartparens-config)
(smartparens-global-mode t)

(require 'multiple-cursors)
(multiple-cursors-mode t)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'ido)
(ido-mode t)

;; smex
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
					; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;; Ruby
;;; Robe

(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

;; indent guide
(require 'indent-guide)
(indent-guide-global-mode)
(setq indent-guide-recursive t)

;;; Coffee Script

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
;; This gives you a tab of 2 spaces
(custom-set-variables
 '(coffee-tab-width 2))

;; expand-region
(require 'expand-region)
    (global-set-key (kbd "C-=") 'er/expand-region)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("0eebf69ceadbbcdd747713f2f3f839fe0d4a45bd0d4d9f46145e40878fc9b098" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "c56d90af9285708041991bbc780a073182cbe91721de17c6e7a8aac1380336b3" "a0fdc9976885513b03b000b57ddde04621d94c3a08f3042d1f6e2dbc336d25c7" "0ed983facae99849805b2f7be926561cb58474eb18e5296d9bb3ad7f9b088a5b" "2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" "f37d09076188b2e8d2a6847931deec17f640853aedd8ea4ef3ac57db01335008" "8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "764e3a6472a3a4821d929cdbd786e759fab6ef6c2081884fca45f1e1e3077d1d" "8d6fb24169d94df45422617a1dfabf15ca42a97d594d28b3584dc6db711e0e0b" "08efabe5a8f3827508634a3ceed33fa06b9daeef9c70a24218b70494acdf7855" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "95db78d85e3c0e735da28af774dfa59308db832f84b8a2287586f5b4f21a7a5b" "95f954ce018bbff3107b357bd87d060db195a2d5c6b70411587223597fde171d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" default)))
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#192028")
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   (("#49483E" . 0)
    ("#67930F" . 20)
    ("#349B8D" . 30)
    ("#21889B" . 50)
    ("#968B26" . 60)
    ("#A45E0A" . 70)
    ("#A41F99" . 85)
    ("#49483E" . 100)))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (coffee-mode smex expand-region indent-guide highlight-indentation aggressive-indent solarized-theme base16-theme twilight-theme twilight-anti-bright-theme flatland-theme subatomic-theme ample-theme color-theme-sanityinc-tomorrow sublime-themes evil-nerd-commenter smartparens robe rinari multiple-cursors markdown-mode magit js2-mode company-inf-ruby)))
 '(sp-highlight-pair-overlay nil)
 '(sp-highlight-wrap-overlay nil)
 '(sp-highlight-wrap-tag-overlay nil)
 '(subatomic-high-contrast nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
