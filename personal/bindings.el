;; Place personal bindings here

;(global-set-key (kbd "<f6>") 'cua-mode)

;(global-set-key (kbd "<f5>") 'longlines-mode)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "<f8>") 'org-agenda-list)
(global-set-key (kbd "<C-f8>") 'org-todo-list)

(global-set-key "\C-c\C-w" 'comment-or-uncomment-region)
(global-set-key "\C-c w" 'comment-or-uncomment-region)

(global-set-key "\M-i" 'shrink-window)
(global-set-key (kbd "M-I") 'enlarge-window-horizontally)

(global-set-key (kbd "<f7>") 'flyspell-mode)
(add-hook 'flyspell-mode-hook
          '(lambda ()
	     (local-set-key (kbd "<C-f7>") 'flyspell-buffer)))

(global-set-key (kbd "<f9>") 'gtd)

(global-set-key (kbd "C-x O") 'previous-multiframe-window)

(global-set-key (kbd "M-T") (lambda () (interactive) (transpose-words -1)))

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-<backspace>") 'backward-kill-word)
