(define (make-deque)
    (define front-ptr '())
    (define rear-ptr '())

    (define (empty-deque?)
      (or (null? front-ptr)
          (null? rear-ptr)))

    ; 前后队头的指针
    (define (set-front-ptr! ptr)
      (set! front-ptr ptr))
    (define (set-rear-ptr! ptr)
      (set! rear-ptr ptr))

    ; 队列每一数据data由两元素的pair组成
    ; (car data)为具体数据
    ; (cdr data)为指向前一个data在队列的位置，注意是在队列位置
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
                  (if (not (empty-deque?))
                    (set-data-ptr! (car front-ptr) '()))
                  dispatch)))

    (define (rear-insert-deque! v)
      (cond ((empty-deque?) (init-first-element v)
                            dispatch)
            (else (let ((new-rear-data (gen-data v)))
                    (set-data-ptr! new-rear-data rear-ptr)
                    (set-cdr! rear-ptr (list new-rear-data))
                    (set-rear-ptr! (cdr rear-ptr)))
                  dispatch)))

    (define (rear-delete-deque!)
      (cond ((empty-deque?) (error "empty-deque")
                            dispatch)
            (else (set-rear-ptr! (cdar rear-ptr))
                  (if (not (empty-deque?))
                    (set-cdr! rear-ptr '()))
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
        ((eq? m 'front-delete!) (front-delete-deque!))
        ((eq? m 'rear-insert!) rear-insert-deque!)
        ((eq? m 'rear-delete!) (rear-delete-deque!))))

    dispatch)

(define dq (make-deque))

((dq 'front-insert!) 1)

((dq 'front-insert!) 2)

((dq 'front-insert!) 3)

((dq 'rear-insert!) 4)

; (dq 'front-delete!)

; (dq 'rear-delete!)

; (dq 'print)

; (dq 'front)

; (dq 'rear)

; (load "p3.23.scm")

; (cdar '((1 2)))

