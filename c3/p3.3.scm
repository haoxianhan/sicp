
(define (make-account balance secret-passwd)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount)) balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch temp_passwd m)
    (if (eq? temp_passwd secret-passwd)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request: MAKE-ACCOUNT" m)))
      (error "incorrect passwd" temp_passwd)))
  dispatch)

(define acc (make-account 100 'correct-passwd))

((acc 'correct-passwd 'withdraw) 40)
((acc 'correct-passwd 'deposit) 40)
((acc 'error-passwd 'deposit) 40)

; (load "p3.3.scm")
