; (add-hook 'c-mode-common-hook (lambda () (add-hook 'before-save-hook 'clang-format-buffer nil t)))

(global-linum-mode t) ; Line Numbers On

; Key bindings
(global-set-key "\C-x\C-b" 'buffer-menu) ; Buffer list appears in same window
(global-set-key (kbd "<M-s-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<M-s-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<M-s-down>") 'shrink-window)
(global-set-key (kbd "<M-s-up>") 'enlarge-window)

; Formatting
(setq-default c-basic-offset 4 tab-width 4 indent-tabs-mode t)
(setq indent-tabs-mode nil)    ; indent w/o using tabs
(setq-default indent-tabs-mode t)
(setq indent-tabs-mode t)
(setq tab-width 4)
 
; Tab Completion
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand preceding word"
  (interactive "*P")
  (if (and
        (or (bobp) (= ?w (char-syntax (char-before))))
        (or (eobp) (not (= ?w (char-syntax (char-after))))))
    (dabbrev-expand arg)
    (insert-tab)))

; Bind fix to Tab
(defun my-tab-fix ()
  (local-set-key [tab] 'indent-or-expand))
; (add-hook 'c-mode-hook 'my-tab-fix)
; (add-hook 'sh-mode-hook 'my-tab-fix)
; (add-hook 'emacs-lisp-mode-hook 'my-tab-fix)

; Evil VIM configurations
(add-to-list 'load-path "~/.emacs.d/evil")
(setq evil-toggle-key "C-`")
(require 'evil)
(evil-mode 1)

; Evil Keybindings
(define-key evil-insert-state-map (kbd "TAB") 'indent-or-expand)
(define-key evil-insert-state-map (kbd "C-SPC") 'dabbrev-expand)

;; Smart buffer switching.
;; Specify
;;  (setq skip-sbtools-iswitch-setup t)
;; prior to loading emacs_setup.el to disable smart buffer switching

(if (and (>= emacs-major-version 21) 
		 (or (not (boundp 'skip-sbtools-iswitch-setup))
			 (not skip-sbtools-iswitch-setup)))
	(progn
	  ;; Improves C-x b, C-x 4 b, C-x 5 b, C-x 4 C-o bindings
	  ;; <RET> selects first buffer in buffer list
	  ;; C-s, C-r moves through buffer list
	  ;; <TAB> for name completion
	  (iswitchb-mode 1)
	  ))

;; Set theme if in terminal
;; Disable all themes if in gnu emacs
(if (display-graphic-p)
	(disable-theme 'adwaita)
   (custom-set-variables
	;; custom-set-variables was added by Custom.
	;; If you edit it by hand, you could mess it up, so be careful.
	;; Your init file should contain only one such instance.
	;; If there is more than one, they won't work right.
	'(custom-enabled-themes (quote (adwaita)))
	'(gdb-non-stop-setting nil t)
	'(git-commit-summary-max-length 100)
	'(message-fill-column 100 t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(git-commit-summary-max-length 100)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))

;; From hongjun @ mathworks
; Change buffer to writable
(defun iedit ()
  "Change the current buffer file into writable"
  (interactive)
  (shell-command (concat "chmod u+w "
                         (buffer-file-name)))
  (revert-buffer nil t)
)
(global-set-key [f3]       'iedit)                  ;

; Grep-Find Emacs
(defun my-grep-find ()
  "my grep find"
  (interactive)
  ;(edit-and-eval-command "Please edit: " '(grep-find "find . -type f -print0 | xargs -0 -e grep -nH -e \"\"|grep -v 'CVS'|grep -v 'TAGS'|grep -v '~' "))
  (eval-minibuffer "Eval: " '("(grep-find \"find . -type f -print0 | xargs -0 -e grep -nH -e \\\"\\\"|grep -v 'CVS'|grep -v 'TAGS'|grep -v '~' \")" . 64))
)

; define an alias to grep-find so that M-x gf is equivalent to M-x grep-find
(defalias 'gf 'my-grep-find)

; Start shells on startup
; Set up shells
(defun init-shells ()
  "Get two shells interactive, execute source ~/.cshrc"
  (shell)
  (rename-buffer "shell-kgleason")
  (shell)
  (rename-buffer (concat "shell@" "kgleason"))    ; frame-title-format: (user-login-name "@" short-hostname ": %f)
)
; (init-shells) ; Uncomment to enable
