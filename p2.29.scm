; sicp 2.29

(define (make-mobile left right)
  (list left right))

(define (left-branch mobile)
  (car mobile))

; a)
(define (rigth-branch mobile)
  (cadr mobile))

(define (make-branch len structure)
  (list len structure))

(define (branch-len branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))


; b)
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (rigth-branch mobile))))

(define (branch-weight branch)
  (cond ((is_structure_mobile? branch)
         (total-weight (branch-structure branch)))
        (else
          (branch-structure branch))))

(define (is_structure_mobile? branch)
  (pair? (branch-structure branch)))


; c) len * weight
(define (mobile-blance? mobile)
  (let ((left (left-branch mobile))
        (right (rigth-branch mobile)))
    (and (same-power? left right)
         (branch-blace? left)
         (branch-blace? right))))

(define (branch-power branch)
  (* (branch-len branch)
     (branch-weight branch)))

(define (same-power? branch1 branch2)
  (= (branch-power branch1)
     (branch-power branch2)))

(define (branch-blace? branch)
  (if (is_structure_mobile? branch)
    (mobile-blance? (branch-structure branch))
    #t))







(define t-left-branch (make-branch 1 5))
(define t-right-branch (make-branch 2 6))
(define t-mobile (make-mobile t-left-branch t-right-branch))

(total-weight t-mobile)

(define t-left-branch1 (make-branch 1 t-mobile))
(define t-right-branch1 (make-branch 2 6))
(define t-mobile1 (make-mobile t-left-branch1 t-right-branch1))

(define t-same-branch (make-branch 2 6))
(define t-mobile2 (make-mobile t-same-branch t-same-branch))


(total-weight t-mobile1)

(mobile-blance? t-mobile2)

; (load "p2.29.scm")
