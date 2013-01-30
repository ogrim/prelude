(global-set-key "\M-i" 'shrink-window)
(global-set-key (kbd "M-I") 'enlarge-window-horizontally)

(global-set-key (kbd "M-T") (lambda () (interactive) (transpose-words -1)))
(global-set-key (kbd "C-j") 'newline-and-indent)

(global-set-key (kbd "M-X") 'helm-mini)
