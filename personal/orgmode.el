(prefer-coding-system 'utf-8)
(set-charset-priority 'unicode)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(defun week-number (date)
  (org-days-to-iso-week
   (calendar-absolute-from-gregorian date)))

(defun week-number-current ()
  (interactive)
  (insert (number-to-string (week-number (calendar-current-date)))))

(defun org-agenda-skip-entry-unless-tags (tags)
  "Skip entries that do not contain specified tags.
TAGS is a list specifying which tags should be displayed.
Inherited tags will be considered."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (atags (split-string (org-entry-get nil "ALLTAGS") ":")))
    (if (catch 'match
          (mapc (lambda (tag)
                  (when (member tag atags)
                    (throw 'match t)))
                tags)
          nil)
        nil
      subtree-end)))

(setq org-agenda-files (quote ("C:\\org\\work.org")))

(setq org-agenda-custom-commands
      '(("w" agenda "" ((org-agenda-ndays 1)))
        ("W" "Daily masterTODOs"
         ((agenda ""))
         ((org-agenda-ndays 1)
          (org-agenda-skip-function
           '(org-agenda-skip-entry-unless-tags '("masterTODO")))
          (org-agenda-overriding-header "Arbeidsoppgaver i dag:")))
        ("v" tags-todo "+boss-urgent")
        ("U" tags-tree "+boss-urgent")
        ("f" occur-tree "\\<FIXME\\>")
        ("u" . "UiB+Name tags searches") ; description for "h" prefix
        ("uf" tags "+UiB+forskningsassistent")
        ("um" tags-todo "+UiB+masterTODO")))

(setq org-latex-to-pdf-process
       '("pdflatex -interaction nonstopmode %b"
         "bibtex %b"
         "pdflatex -interaction nonstopmode %b"
         "pdflatex -interaction nonstopmode %b"
	 "rm %b.bbl %b.blg"))



;; (setq org-export-latex-listings t)
;; (add-to-list 'org-export-latex-packages-alist '("" "listings"))
;; (add-to-list 'org-export-latex-packages-alist '("" "color"))

(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-c c") 'reftex-citep)
            ;(define-key org-mode-map (kbd "M-e") 'my-next-sentence)
            ;(define-key org-mode-map (kbd "M-a") 'my-last-sentence)
            (define-key org-mode-map (kbd "C-c w") 'week-number-current)
            (define-key org-mode-map (kbd "C-M-k") 'kill-current-sentence)
            (define-key org-mode-map (kbd "C-c h") 'timerange-insert-hours)
            (define-key org-mode-map (kbd "C-c j") 'timerange-insert-hours-minus-lunch)
            (define-key org-mode-map (kbd "C-c t") 'insert-timetable)
            (local-unset-key [(meta tab)])
	    (reftex-mode)
            (add-to-list 'org-export-latex-packages-alist '("" "amsmath" t))
            (setcar (rassoc '("wasysym" t) org-export-latex-default-packages-alist) "integrals")
            (make-local-variable 'sentence-highlight-mode)
            (setq sentence-highlight-mode t)
            (add-hook 'post-command-hook 'sentence-highlight-current)
            (set (make-local-variable 'global-hl-line-mode) nil)
            (add-to-list 'org-structure-template-alist
             (quote ("C" "#+begin_comment\n?\n#+end_comment" "<!--\n?\n-->")))
            ))

(setq reftex-cite-format 'natbib)

(defun gtd ()
  (interactive)
  (find-file "C:\\org\\work.org")
  (linum-mode 0))

(setq org-log-done t)
(setq org-todo-keywords '((sequence "NEXT" "WAITING" "DELEGATED" "|" "DONE" "CANCELED" )))
(setq org-tag-alist '(("telefon" . ?t) ("epost" . ?e) ("hjemma" . ?h) ("data" . ?d)))
(setq org-indent-mode-turns-on-hiding-stars nil)
(setq org-directory "~/org")

;(add-to-list 'org-export-latex-packages-alist '("" "amsmath" t))
;(setcar (rassoc '("wasysym" t) org-export-latex-default-packages-alist) "integrals")
