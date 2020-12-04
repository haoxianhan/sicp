
(define x '((a b) c d))
(define y '(e f))

(define z (cons y x))

(set-car! x y)
