

(define (square-tree tree)
  (cond ((null? tree)
         '())
        ((not (pair? tree))
         (square tree))
        (else
          (cons (square-tree (car tree))
                (square-tree (cdr tree))))))



(square-tree (list (list 1 2) (list 3 4)))

(define (square-tree-map tree)
  (map (lambda (x)
         (cond ((not (pair? x))
                (square x))
               (else
                 (square-tree-map x)))) tree))

(square-tree-map (list (list 1 2) (list 3 4)))

; (load "p2.30.scm")

