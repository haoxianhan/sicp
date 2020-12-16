(define (make-deque)
    (define front-ptr '())
    (define rear-ptr '())
    (define (empty-deque?)
      (or (null? front-ptr)
          (null? rear-ptr)))
    (define (set-front-ptr! ptr)
      (set! front-ptr ptr))
    (define (set-rear-ptr! ptr)
      (set! rear-ptr ptr))

    (define (gen-data v)
      (cons v '()))
    (define (set-data-ptr! data ptr)
      (set-cdr! data ptr))

    (define (init-first-element v)
      (let ((init-list (list (gen-data v))))
        (set-front-ptr! init-list)
        (set-rear-ptr! init-list)))


    (define (front-insert-deque! v)
      (cond ((empty-deque?) (init-first-element v)
                            dispatch)
            (else (let ((new-front-ptr (cons (gen-data v) front-ptr))
                        (old-first-data (car front-ptr)))
                    (set-data-ptr! old-first-data new-front-ptr)
                    (set-front-ptr! new-front-ptr))
                  dispatch)))

    (define (front-delete-deque!)
      (cond ((empty-deque?) (error "empty-deque")
                            dispatch)
            (else (set-front-ptr! (cdr front-ptr))
                  dispatch)))

    (define (print-deque)
      (define (iter q acc)
        (cond ((null? q) (reverse acc))
              (else
                (iter (cdr q) (cons (caar q) acc)))))
      (cond ((empty-deque?)
             (display '()))
            (else
              (display (iter front-ptr '())))))

    (define (dispatch m)
      (cond
        ((eq? m 'print) (print-deque))
        ((eq? m 'front) front-ptr)
        ((eq? m 'rear) rear-ptr)
        ((eq? m 'front-insert!) front-insert-deque!)
        ((eq? m 'front-delete!) front-delete-deque!)))

    dispatch)

(define dq (make-deque))

((dq 'front-insert!) 1)

((dq 'front-insert!) 2)

((dq 'front-insert!) 3)

(dq 'print)

(dq 'front)

(dq 'rear)


; (load "p3.23.scm")

