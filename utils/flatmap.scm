(load "utils/accumulate.scm")

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(flatmap (lambda (x)
           (list x 1)) (list 1 2 3 4 5))

; (load "utils/flatmap.scm")
