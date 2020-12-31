

(define (square-tree tree)
  (tree-map square tree))

(define (tree-map functor tree)
  (map (lambda (x)
         (cond ((not (pair? x))
                (functor x))
               (else
                 (tree-map functor x)))) tree))

(square-tree (list (list 1 2) (list 3 4)))

; (load "p2.31.scm")

