;; This is where everything starts. Do you remember this place?
;; It remembers you...
;;remove scroll-bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defun live-user-first-name ()
  (let* ((first-name (car (split-string user-full-name))))
    (if first-name
        (capitalize first-name)
      "")))

(defun live-user-first-name-p ()
  (not (string-equal "" (live-user-first-name))))
(setq live-supported-emacsp t)
(setq live-disable-zone nil)



(setq live-ascii-art-logo ";;
;;  o    MM\"\"\"\"\"\"\"\"`M
;;  |    MM  mmmmmmmM
;;  |    M`      MMMM 88d8b.d8b. .d8888b. .d8888b. .d8888b.
;;  o    MM  MMMMMMMM 88''88'`88 88'  `88 88'  `\"\" Y8ooooo.
;;  |    MM  MMMMMMMM 88  88  88 88.  .88 88.  ...       88
;;  |    MM        .M dP  dP  dP `88888P8 '88888P' '88888P'
;;  o    MMMMMMMMMMMM
;;  |                           _-`````-,           ,- '- .
;;  |                          .'   .- - |          | - .   `.
;;  o                         /.'  /                     `.   \\
;;  |___                    :/    :     _...   ..._       ``   :
;; /    \\                   ::    :     /._ .`:'_..\\.     ||   :
;; o     o                  ::    `._ ./  ,`  :     \\ . _.''   .
;; |     |                   `:.      |   |  -.  \\-. \\\\_      /
;; |    / \\                   \\:._ _/  ..'  .@)   \\@) ` `\\ ,.'
;; o   o   o                      _/,--'       .- .\\,-.`--`.
;;     |   |                        ,'/''     (( \\ `  )
;;     |   |                         /'/'  \\    `-'  (
;;     o   o                          '/''  `._,-----'
;;     |   |                           ''/'    .,---'
;;     x   |                            ''/'      ;:
;;         o                              ''/''  ''/
;;         |                                ''/''/''
;;         |                                  '/'/'
;;         o                                   `;
;;")

;;preload.el ends here

