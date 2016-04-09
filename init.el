;;; Commentary:
;;;init.el --- for initialing the Emacs
(require 'package)

;;; code:
;;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))

;;; add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; melpa
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) ;; You might already have this line

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; hide bar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
;; (electric-indent-mode -1)

(setq max-mini-window-height 1.00)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; don't auto break line
(set-default 'truncate-lines t)

(setq ring-bell-function 'ignore)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 删除空行和行尾空格
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 主题
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-theme 'material-one t)
;; (load-theme 'spacegray t)
;; (load-theme 'atom-one-dark t)
;; (load-theme 'flatland t)
;;(load-theme 'eclipse t)
;; (load-theme 'smyx t)
;; (load-theme 'brin t)
;; (load-theme 'ujelly t)
;; (load-theme 'cyberpunk t)
;; (load-theme 'noctilux-definitions t)
;; (load-theme 'noctilux t)
;; (load-theme 'zenburn t)
;; (load-theme 'spolsky t)
;; (load-theme 'subatomic t)

;; (load-theme 'ample t)
;; (enable-theme 'ample)
;; (load-theme 'monokai t)
;; (load-theme 'molokai t)
;; (setq molokai-theme-kit t)

(global-hl-line-mode 1)
;; (setq-default line-spacing 8)
;; (column-number-mode 1)
(custom-set-faces
 ;; '(col-highlight ((t (:background "#3F4A5A"))))
 ;; '(hl-line ((t (:background "#323A43"))))
                                        ;'(hl-line ((t (:background "#999999"))))
 ;; '(lazy-highlight ((t (:background "#aa8888" :foreground "#ffffff"))))
 )

;;指针颜色
(set-cursor-color "white")

;;鼠标颜色
(set-mouse-color "white")

(set-face-attribute 'vertical-border
                    nil
		    ;; :foreground "#232830") ;; for spacegray
                    :foreground "#1e1e1e") ;; for material one

;; 显示行列号
(setq column-number-mode t)
(setq line-number-mode t)
(column-number-mode t)     ;在模式行上显示行号列号
(setq linum-format "  %d   ")
;; (setq linum-format "%5d \u2502 ")
;; (custom-set-faces '(linum ((t (:foreground "pink" :background "#363a4a" :box nil)))) )

;; (require 'linum-relative)


;; (custom-set-faces '(linum ((t (:foreground "pink")))) )


;; 初始宽高
;; (add-to-list 'default-frame-alist '(height . 36))
(add-to-list 'default-frame-alist '(width . 136))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 显示行号
(global-linum-mode t)

;; Treat 'y' as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)

;; 寻找文件的默认路径
(setq default-directory "~/projects/")

;; (setq inhibit-splash-screen t)
;; (setq inhibit-startup-screen t)
;;(setq inhibit-startup-message t)
;; (setq inhibit-startup-message t)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(setq make-backup-files nil)

;;不生成#file_name#临时文件
(setq auto-save-default nil)

;; (global-visual-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; fringe mode

;; (setq-default left-fringe-width  0)
;; (setq-default right-fringe-width  0)
;; (set-face-attribute 'fringe nil :background "#363a4a")

(fringe-mode 0)
;; (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
;; (global-visual-line-mode nil)
;; (setq-default right-fringe-width 0)
;; (setq-default left-fringe-width 0)
;; (add-to-list 'default-frame-alist '(left-fringe . 0))
;; (add-to-list 'default-frame-alist '(right-fringe . 1))
;; (set-face-attribute 'fringe nil :background "#232830")

;; (fringe-mode '(8 . 1))
;; (defun hide-fringes ()
;;   (set-face-attribute 'left-fringe nil :background "#232830"))
;; ;;
;; (add-hook 'neotree-mode-hook 'hide-fringes)

;; font
;; (set-default-font "Monaco-11")
;; (set-default-font "Source Code Pro-10.9")
(set-frame-font "CamingoCode 10")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)

(eval-after-load 'company
  '(progn
     (define-key company-active-map [backtab] 'company-select-previous)
     (define-key company-active-map [S-tab] 'company-select-previous)
     (define-key company-active-map [tab] 'company-select-next)))
(setq company-selection-wrap-around t)

;;; UI
(require 'color)

;; (bg (face-attribute 'default :background))
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
                                        ; `(company-tooltip ((t (:inherit default :background "black"))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; yasnippet
;; (yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; flycheck

(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fill-column-indictor
(require 'fill-column-indicator)
(setq fci-rule-width 3)
(setq fci-rule-color "#2a2c3e")
(setq fci-rule-column 80)

;;; (add-hook 'after-change-major-mode-hook 'fci-mode)
;;; (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;; (global-fci-mode 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multiple-cursors

(require 'multiple-cursors)
(multiple-cursors-mode t)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme 'ascii) ; 'classic, 'nerd, 'ascii, 'arrow
(setq neo-window-width 39)
;; (setq neo-smart-open t)

(setq projectile-switch-project-action 'neotree-projectile-action)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
        (file-name (buffer-file-name)))
    (if project-dir
        (progn
          (neotree-dir project-dir)
          (neotree-find file-name))
      (neotree-find))))
;; (message "Could not find git project root."))))

(evil-leader/set-key
  "nn" 'neotree-project-dir
  )

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "r") 'neotree-rename-node)
            (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
            (define-key evil-normal-state-local-map (kbd "a") 'neotree-create-node)
            (define-key evil-normal-state-local-map (kbd "u") 'neotree-refresh)
            (define-key evil-normal-state-local-map (kbd "c") 'neotree-change-root)
            (define-key evil-normal-state-local-map (kbd "p") 'neotree-select-up-node)
            (define-key evil-normal-state-local-map (kbd "s") 'neotree-select-next-sibling-node)
            (define-key evil-normal-state-local-map (kbd "S") 'neotree-select-previous-sibling-node)
            (define-key evil-normal-state-local-map (kbd "th") 'neotree-hidden-file-toggle)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))



;;; neotree UI

;;; for spacegray
;; (custom-set-faces
;;  '(neo-dir-link-face ((t (:foreground "#515A66"))))
;;  ; '(neo-file-link-face ((t (:foreground "#A8B1B8"))))
;;  '(neo-file-link-face ((t (:foreground "#919AA6"))))
;;  '(neo-expand-btn-face ((t (:foreground "#515A66"))))
;;  '(neo-banner-face ((t (:foreground "#515A66"))))
;;  '(neo-header-face ((t (:foreground "#515A66"))))
;;  '(neo-button-face ((t (:foreground "#515A66"))))
;;  '(neo-root-dir-face ((t (:foreground "EEA2AD"))))
;; )

(add-hook 'neotree-mode-hook 'change-neotree-background-color)
(add-hook 'neotree-mode-hook 'neotree-set-margins)

(defun change-neotree-background-color ()
  (interactive)
  ;; (setq buffer-face-mode-face `(:background "#232830")) ;; for spacegray
  (setq buffer-face-mode-face `(:background "#1e1e1e")) ;; for material one
  (buffer-face-mode 1))

(defun neotree-set-margins ()
  "Set margins in current buffer."
  (setq left-margin-width 1)
  (setq top-margin-width 1)
  (setq right-margin-width 0)
  )


;; (add-hook 'neotree-mode-hook
;;             (lambda ()
;;               (set-background-color "#232830")))
(custom-set-variables)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm

(require 'helm)
(require 'helm-config)
;; (require 'helm-themes)
;; (helm-mode 1)
;; (setq enable-recursive-minibuffers t)

(setq helm-buffers-fuzzy-matching t)
(setq helm-imenu-fuzzy-matching t)
(setq helm-completion-in-region-fuzzy-matching t)
(setq helm-quick-update t)
(setq helm-split-window-in-side-p t)
(setq helm-move-to-line-cycle-in-source t)
(setq helm-ff-file-name-history-use-recentf t)

(evil-leader/set-key
  "hf" 'helm-find
  "hr" 'helm-recentf
  "hm" 'helm-imenu
  "hf" 'helm-find-files
  "hb" 'helm-buffers-list
  )

;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;; (global-set-key (kbd "C-x C-m") 'helm-imenu)

;; (define-key helm-map (kbd "<tab>") nil)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)

;;(add-to-list 'helm-completing-read-handlers-alist '(find-file . ido))

;;; helm UI
(setq helm-display-header-line nil) ;; t by default
(set-face-attribute 'helm-source-header nil :height 0.1)
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)
(setq helm-split-window-in-side-p t)

;;; projectile
(projectile-global-mode)
(projectile-mode t)
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)

;; Show projectile lists by most recently active
(setq projectile-enable-caching t)
(setq projectile-sort-order (quote recently-active))

(evil-leader/set-key
  "pp" 'projectile-switch-project
  "pf" 'projectile-find-file
  "pc" 'projectile-invalidate-cache
  "pr" 'projectile-recentf
  "pb" 'projectile-display-buffer
  )

(global-set-key (kbd "C-'") 'projectile-find-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; recentf
(require 'recentf)
(recentf-mode 1)

(setq recentf-max-menu-items 100)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(setq ido-auto-merge-work-directories-length -1)

(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
            (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
            (define-key ido-completion-map (kbd "C-j") 'ido-next-match)
            (define-key ido-completion-map (kbd "C-k") 'ido-prev-match)))
;; (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
;; (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
;; (define-key helm-map (kbd "C-z") 'helm-select-action)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; flx-ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ido-vertical-mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

;;; UI
(setq ido-vertical-show-count t)
(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background nil
                    :foreground "orange")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ivy mode

(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key "\C-r" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key [f6] 'ivy-resume)

(defun ivy-couns-git ()
  "Find file in the current Git repository."
  (interactive)
  (let* ((default-directory (locate-dominating-file
                             default-directory ".git"))
         (cands (split-string
                 (shell-command-to-string
                  "git ls-files --full-name --")
                 "\n"))
         (file (ivy-read "Find file: " cands)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-c f") 'couns-git)

(evil-leader/set-key
  "ib" 'ivy-switch-buffer
  "/" 'swiper
  "ir" 'ivy-recentf
  "if" 'ivy-couns-git
  "im" 'imenu
  )

;;; find-file-in-project

(require 'find-file-in-project)
(autoload 'ivy-read "ivy")
;; (setq projectile-completion-system 'ivy)

(evil-leader/set-key
  "fp" 'find-file-in-project
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smex
;; Not needed if you use package.el
(require 'smex)
;; Can be omitted. This might cause a (minimal) delay
;; when Smex is auto-initialized on its first run.
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smartparens
;; global
;; (require 'smartparens-config)
;; (smartparens-global-mode t)

;; highlights matching pairs
;; (show-smartparens-global-mode t)

;; (set-face-attribute 'sp-pair-overlay-face nil :background "black")


(show-paren-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; highlight-parentheses
;; (require 'highlight-parentheses)

;;; evil mode
(require 'evil)
(evil-mode 1)

;; remove all keybindings from insert-state keymap, use emacs-state when editing
(setcdr evil-insert-state-map nil)

(define-key global-map (kbd "C-t") 'switch-to-completions)
;; ESC to switch back normal-state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; (define-key evil-motion-state-map "ge" nil)
(define-key evil-motion-state-map (kbd "ge") 'end-of-line)
(define-key evil-normal-state-map (kbd "ge") 'end-of-line)
(define-key evil-visual-state-map (kbd "ge") (kbd "$h"))
(define-key evil-normal-state-map (kbd "gb") 'beginning-of-line)
(define-key evil-normal-state-map (kbd "ga") (kbd "^"))

(define-key evil-normal-state-map (kbd "gp") (kbd "%"))
(define-key evil-visual-state-map (kbd "gp") (kbd "%"))

(define-key evil-normal-state-map (kbd "SPC vs") (kbd ":vs<tab>"))
(define-key evil-normal-state-map (kbd "SPC hs") (kbd ":sp<tab>"))
(define-key evil-normal-state-map (kbd "C-h") (kbd "C-w h"))
(define-key evil-normal-state-map (kbd "C-j") (kbd "C-w j"))
(define-key evil-normal-state-map (kbd "C-k") (kbd "C-w k"))
(define-key evil-normal-state-map (kbd "C-l") (kbd "C-w l"))

;; (define-key evil-normal-state-map (kbd "w") 'evil-window-top)
;; (define-key evil-normal-state-map (kbd "b") 'evil-window-bottom)
;; (define-key evil-normal-state-map (kbd "H") 'evil-backward-word-begin)
;; (define-key evil-normal-state-map (kbd "L") 'evil-forward-word-begin)

(define-key evil-insert-state-map (kbd "C-d") 'delete-backward-char)
(define-key evil-insert-state-map (kbd "M-d") 'backward-kill-word)


;; (global-set-key [escape] 'keyboard-quit)
(global-set-key [escape] 'keyboard-escape-quit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; For easy motion
(evilem-default-keybindings ",")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; For surround

(require 'evil-surround)
(global-evil-surround-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; For shell
(add-hook 'term-mode-hook (lambda()
                            (yas-minor-mode -1)))

(setq shell-command-switch "-ic")

;; Setting PATH
;; (setenv "PATH"
;;   (concat
;;    "/to/some/path" ":"
;;    (getenv "PATH")
;;   )
;; )

(evil-leader/set-key
  "zsh" 'ansi-term
  "sh" 'shell-command
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; evil-leader
(require 'evil-leader)
(global-evil-leader-mode)
;; (evil-leader/set-leader ",")
(evil-leader/set-leader "SPC")

;;; For all
(evil-leader/set-key

  ;;; For window
  "wk" 'windmove-up
  "wj" 'windmove-down
  "wl" 'windmove-right
  "wh" 'windmove-left
  ;; "vs" 'split-window-right
  ;; "hs" 'split-window-below
  "wm" 'maximize-window
  "ww" 'delete-other-windows
  "wx" 'delete-window

  "xo" 'pop-global-mark

  ;; Start with M-
  "SPC x" 'smex
  "SPC md" 'make-directory

  ;; Start with C-
  "xc" 'save-buffers-kill-emacs
  "xk" 'kill-buffer

  ;; Mode
  "SPC SPC w" 'web-mode
  )

;;; ido
(evil-leader/set-key
  "xf" 'ido-find-file
  "xb" 'ido-switch-buffer
  "xxb" 'buffer-menu
  )

;;; Magit

(evil-set-initial-state 'magit-commit-mode 'motion)
(setq evil-leader/no-prefix-mode-rx '("magit-.*-mode" "gnus-.*-mode"))

(evil-leader/set-key
  "gs" 'magit-status
  "gr" 'magit-remote-add
  "gi" 'magit-init
  "gc" 'magit-clone
  "gl" 'magit-log-all
  "gd" 'magit-file-delete
  )

;;; evil-nerd-commenter

;; (evilnc-default-hotkeys)

;; evil-nerd-comment:  Emacs key bindings
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

;; evil-nerd-comment: Vim key bindings
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Ruby

(add-hook 'ruby-mode-hook 'projectile-on)

;;; Robe
(require 'robe)

(add-hook 'ruby-mode-hook 'robe-mode)

(global-company-mode t)
(push 'company-robe company-backends)

;;;
(require 'rinari)
;; (global-rinari-mode t)

;;; projectile-rails
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(add-hook 'rinari-minor-mode-hook
	  (lambda ()
	    (evil-leader/set-key
	      "rr" 'rinari-rake
	      "rs" 'rinari-web-server
	      "rS" 'rinari-web-server-restart
	      "rk" 'rinari-console
	      "re" 'rinari-test
	      "rq" 'rinari-sql

	      "rm" 'rinari-find-model
	      "rc" 'rinari-find-controller
	      "rv" 'rinari-find-view
	      "rn" 'rinari-find-migration
	      "rh" 'rinari-find-helper
	      "rt" 'rinari-find-test
	      "rj" 'rinari-find-javascript
	      "ry" 'rinari-find-stylesheet

	      "rff" 'rinari-find-file-in-project
	      "rfn" 'rinari-find-configuration
	      "rfl" 'rinari-find-log
	      "rfe" 'rinari-find-environment
	      "rfx" 'rinari-find-fixture
	      )))

(add-hook 'projectile-rails-mode-hook
	  (lambda ()
	    (evil-leader/set-key
	      "rg" 'projectile-rails-generate
	      "rR" 'projectile-rails-rake
	      "r!s" 'projectile-rails-sever
	      "rK" 'projectile-rails-console

	      "rM" 'projectile-rails-find-model
	      "rC" 'projectile-rails-find-controller
	      "rV" 'projectile-rails-find-view
	      "rN" 'projectile-rails-find-migration
	      "rH" 'projectile-rails-find-helper
	      "rT" 'projectile-rails-find-test

	      "rfL" 'projectile-rails-find-log
	      "rfX" 'projectile-rails-find-fixture
	      "rfg" 'projectile-rails-goto-gemfile
	      "rfr" 'projectile-rails-goto-routes
	      "rfs" 'projectile-rails-goto-schema
	      )))

(evil-leader/set-key
  "rirb" 'inf-ruby
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; web-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq-default indent-tabs-mode nil)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  ;; padding
  (setq web-mode-style-padding 1)
  (setq web-mode-script-padding 1)
  (setq web-mode-block-padding 0)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)
(setq web-mode-enable-css-colorization t)

(set-face-attribute 'web-mode-html-tag-face nil :foreground "#E55086")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Emmet
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; (add-hook 'html-mode-hook  'emmet-mode)
;; (add-hook 'haml-mode-hook  'emmet-mode)
;; (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; (add-hook 'scss-mode-hook  'emmet-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; load & configure js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-mode-hook
      '(lambda () (progn
                    (set-variable 'indent-tabs-mode nil)
                    (set-variable 'tab-width 4)
                    )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; scss-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'scss-mode 'scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; haml
(require 'haml-mode)

(setq haml-mode-hook
      '(lambda () (progn
                    (set-variable 'tab-width 2)
                    )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Elixir alchemist
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq alchemist-execute-command "/usr/local/bin/elixir")


(add-hook 'elixir-mode-hook 'alchemist-mode)

(defun my-eex-mode ()
  "Hooks for eex file."
  (web-mode)
  (alchemist-mode)
  )

(add-to-list 'auto-mode-alist '("\\.eex\\'" . my-eex-mode))

(add-hook 'alchemist-mode-hook
          (lambda ()
            (evil-leader/set-key
              "ecb" 'alchemist-compile-this-buffer
              "ecf" 'alchemist-compile-file
              "eeb" 'alchemist-execute-this-buffer
              "eef" 'alchemist-execute-file
              "eh" 'alchemist-help-search-at-point
              "eH" 'alchemist-help

              "egd" 'alchemist-goto-definition-at-point
              "egb" 'alchemist-goto-jump-back

              ;; iex
              "eip" 'alchemist-iex-project-run
              "eil" 'alchemist-iex-send-current-line
              "eir" 'alchemist-iex-send-region
              "eib" 'alchemist-iex-compile-this-buffer

              ;;eval
              "evl" 'alchemist-eval-current-line
              "evL" 'alchemist-eval-print-current-line
              "evr" 'alchemist-eval-region
              "evR" 'alchemist-eval-print-region

              "etf" 'alchemist-project-toggle-file-and-tests
              "efX" 'alchemist-project-run-tests-for-current-file
              "efT" 'alchemist-project-find-test
              "efL" 'alchemist-project-find-lib

              ;; phoenix
              "efw" 'alchemist-phoenix-find-web
              "efc" 'alchemist-phoenix-find-controllers
              "efl" 'alchemist-phoenix-find-channels
              "eft" 'alchemist-phoenix-find-templates
              "efm" 'alchemist-phoenix-find-models
              "efv" 'alchemist-phoenix-find-views
              "efs" 'alchemist-phoenix-find-static
              "efr" 'alchemist-phoenix-router
              "efR" 'alchemist-phoenix-routes
              )))

(evil-leader/set-key
  "eiex" 'alchemist-iex-run
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scheme
;; geiser
(setq geiser-active-implementations '(guile))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; racket mode
(add-to-list 'auto-mode-alist '("\\.rkt?\\'" . racket-mode))

(add-hook 'racket-mode-hook
	  (lambda ()
	    (evil-leader/set-key
	      "rr" 'racket-run
	      "rt" 'racket-test)
	    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Haskell mode
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sql-indent
(eval-after-load "sql"
  '(load-library "sql-indent"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; indent guide
;; (require 'indent-guide)
;; (indent-guide-global-mode)
;; (setq indent-guide-recursive t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Coffee Script

(add-to-list 'auto-mode-alist '("\\.coffee$\\'" . coffee-mode))

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
;; This gives you a tab of 2 spaces
(custom-set-variables
 '(coffee-tab-width 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(evil-leader/set-key
  "er" 'er/expand-region
  )

;; powerline
(require 'powerline)
(require 'powerline-evil)
;; (display-time-mode t)
(require 'powerline-my-theme)
(powerline-my-theme)
;; (powerline-default-theme)

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

;;; Longline
;; (require 'longlines)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; aggressive-indent-mode

(global-aggressive-indent-mode 1)

;; (add-hook 'ruby-mode-hook #'aggressive-indent-mode)
;; (add-hook 'elixir-mode-hook #'aggressive-indent-mode)
;; (add-hook 'racket-mode-hook #'aggressive-indent-mode)
;; (add-hook 'scheme-mode-hook #'aggressive-indent-mode)
;; (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
;; (add-hook 'haskell-mode-hook #'aggressive-indent-mode)
;; (add-hook 'js-mode-hook #'aggressive-indent-mode)
;; (add-hook 'html-mode-hook #'aggressive-indent-mode)
;; (add-hook 'haml-mode-hook #'aggressive-indent-mode)
;; (add-hook 'css-mode-hook #'aggressive-indent-mode)
;; (add-hook 'scss-mode-hook #'aggressive-indent-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; indent guide

(indent-guide-global-mode)
(setq indent-guide-recursive t)

;;; dired mode

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "C-e C-e") 'wdired-change-to-wdired-mode)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customise
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; init.el ends here
