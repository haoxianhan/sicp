
(define (make-account balance secret-passwd)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount)) balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (set-passwd new-passwd)
    (set! secret-passwd new-passwd))
  (define (dispatch temp-passwd m)
    (if (eq? temp-passwd secret-passwd)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'set-passwd) set-passwd)
            (else (error "Unknown request: MAKE-ACCOUNT" m)))
      (error "incorrect passwd" temp-passwd)))
  dispatch)

(define (make-joint acccount origin-passwd my-passwd)
  (lambda (temp-passwd m)
    (if (eq? temp-passwd my-passwd)
      (acccount origin-passwd m)
      (error "incorrect passwd" temp-passwd))))



(define acc (make-account 100 'correct-passwd))

(define acc1 (make-joint acc 'correct-passwd 'acc1-passwd))

((acc 'correct-passwd 'withdraw) 40)
((acc 'correct-passwd 'deposit) 40)
; ((acc 'error-passwd 'deposit) 40)

((acc1 'acc1-passwd 'deposit) 40)

; (load "p3.7.scm")
