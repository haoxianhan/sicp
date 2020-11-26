
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

; (load "accumulate.scm")

; (fold-right / 1 (list 1 2 3))
; (fold-left / 1 (list 1 2 3))
;
; (fold-right - 0 (list 1 2 3))
; (fold-left - 0 (list 1 2 3))
