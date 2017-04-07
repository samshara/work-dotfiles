;;; Custom configuration of Samshara's for Prelude
;;; Commentary:
;;; This is where everything starts. Do you remember this place?

;;; Code:

;; make fringe smaller
(if (fboundp 'fringe-mode)
    (fringe-mode 4))
;;remove truncated-lines-indicator
(setq-default fringe-indicator-alist
              (assq-delete-all 'truncation fringe-indicator-alist))

;;use ace window to switch windows
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;;Don't break lines for me,please
(setq-default truncate-lines t)


(setq live-welcome-messages
      (if (live-user-first-name-p)
          (list (concat "Hello "(live-user-first-name)",somewhere in the world the sun is shining for you right now.")
                (concat "Hello "(live-user-first-name)",it's lovely to see you again. I do hope that you're well.")
                (concat (live-user-first-name)",turn your head towards the sun and the shadows will fall behind you.")
                (concat "Happy hacking!, master " (live-user-first-name))
                (concat (live-user-first-name)",may the force be with you.")
                "A man chooses , a slave obeys"
                )
        (list  "Hello, somewhere in the world the sun is shining for you right now."
               "Hello, it's lovely to see you again. I do hope that you're well."
               "Turn your head towards the sun and the shadows will fall behind you."
               "Happy hacking!")))

;; (require 'zone)
;; (setq zone-programs [zone-pgm-putz-with-case])
(defun live-welcome-message ()
  (nth (random (length live-welcome-messages)) live-welcome-messages))
(setq initial-scratch-message (concat live-ascii-art-logo"
;;
;;
;;"(live-welcome-message) "
"))
;;(if (not live-disable-zone)
;;     (add-hook 'term-setup-hook 'zone))


;;customize the mode line
(setq sml/theme 'dark)
(sml/setup)

;;suppress file dialog box
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;;clean auto indent with electric indent
(require 'clean-aindent-mode)
(set 'clean-aindent-is-simple-indent t)
;;helm window customization
;;(setq helm-display-header-line nil)
;;(set-face-attribute 'helm-source-header nil :height 0.1)
;;(helm-autoresize-mode 1)
;;(setq helm-autoresize-max-height 30)
;;(setq helm-split-window-in-side-p t)

;; Disable mouse buffer menu globally
(global-unset-key [C-down-mouse-1])
;; multiple cursors functionality
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)

;;Disable mouse or touchpad in emacs
(define-minor-mode disable-mouse-mode
  "A minor-mode that disables all mouse keybinds."
  :global t
  :lighter " ☣"
  :keymap (make-sparse-keymap))

(dolist (type '(mouse down-mouse drag-mouse
                      double-mouse triple-mouse))
  (dolist (prefix '("" C- M- S- M-S- C-M- C-S- C-M-S-))
    ;; Yes, I actually HAD to go up to 7 here.
    (dotimes (n 7)
      (let ((k (format "%s%s-%s" prefix type n)))
        (define-key disable-mouse-mode-map
          (vector (intern k)) #'ignore)))))

(disable-mouse-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
;; custom.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 98 :width normal))))
 '(vertical-border ((t (:foreground "#3F3F3F")))))
