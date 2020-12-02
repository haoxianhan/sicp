(define (call-the-cops) (display "cops here"))

(define (make-account balance secret-passwd)
  (let ((error-count 0)
        (max-error-count 7))

    (define (error-add unuse-arg) ;; 注意这里要接收一个参数
      (begin
        (display error-count)
        (set! error-count (+ error-count 1))
        (if (> error-count max-error-count)
          (call-the-cops)
          (display "incorrect passwd"))))


    (define (withdraw amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch temp-passwd m)
      (begin
        (if (eq? temp-passwd secret-passwd)
          (cond ((eq? m 'withdraw) withdraw) ; 注意这里的 withdraw是个方法,需要接收参数
                ((eq? m 'deposit) deposit)
                (else (error "Unknown request: MAKE-ACCOUNT" m)))
          error-add)))
    dispatch))

; (define acc (make-account 100 'correct-passwd))
; ((acc 'correct-passwd 'withdraw) 40)
; ((acc 'correct-passwd 'deposit) 40)

((acc 'error-passwd 'deposit) 40)

; (load "p3.4.scm")
