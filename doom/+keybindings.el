;;;  -*- lexical-binding: t; -*-

(map! :nv :leader "cl" 'evilnc-comment-or-uncomment-lines)
(map! :nv :leader "cq" 'evilnc-quick-comment-or-uncomment-to-the-line)
(map! :nv :leader "cc" 'evilnc-copy-and-comment-lines)
(map! :nv :leader "cp" 'evilnc-comment-or-uncomment-paragraphs)
(map! :nv :leader "cr" 'comment-or-uncomment-region)
(map! :nv :leader "cv" 'evilnc-toggle-invert-comment-line-by-line)

(define-key company-active-map [tab] 'company-complete)
(define-key company-active-map (kbd "C-j") 'company-select-next)
(define-key company-active-map (kbd "C-k") 'company-select-previous)
