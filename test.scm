
(define x '((a b) c d))
(define y '(e f))

(define z (cons y x))

(set-car! x y)

(define text1 (cons (list 'a 'b) (list 'a 'b)))
(set-car! (car text1) 'wow)
text1

(define text2-sub (list 'a 'b))
(define text2 (cons text2-sub text2-sub))
(set-car! (car text2) 'wow)
text2

