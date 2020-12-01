(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))


(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))


(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (cons (symbol-leaf next-branch)
                (decode-1 (cdr bits) tree))
          (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit: CHOOSE-BRANCH" bit))))


(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair) ; symbol
                             (cadr pair)) ; frequency
                  (make-leaf-set (cdr pairs))))))

;; p2.67
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree (make-leaf 'B 2)
                                  (make-code-tree (make-leaf 'D 1) (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(decode sample-message sample-tree)
;; p2.67


;; p2.68
;; 构造编码树时，symbols将子集都保存起来，所以每次搜索分别检测左右子树来递归
(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
        ((symbols-in-tree? symbol (left-branch tree))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        ((symbols-in-tree? symbol (right-branch tree))
         (cons 1 (encode-symbol symbol (right-branch tree))))
        (else (error "not in tree"))))

(define (symbols-in-tree? symbol tree)
  (not (false?
         (find (lambda(x)
                 (eq? x symbol))
               (symbols tree)))))

(encode-symbol 'c sample-tree)
(encode '(a d a b b c a) sample-tree)
;; p2.68

;; p2.69
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;; 合并好的要重新放回集合，定序后再继续合并，最后停止于只有一个元素的集合即结果
(define (successive-merge leaf-set)
  (cond ((null? leaf-set) '())
        ((null? (cdr leaf-set)) (car leaf-set))
        (else (successive-merge
                (adjoin-set (make-code-tree (car leaf-set)
                                            (cadr leaf-set))
                            (cddr leaf-set))))))

(generate-huffman-tree '((a 4) (b 2) (c 1) (d 1)))
;; p2.69

;; p2.70
(define p-2-70-symbol-frequence
  '((A 1) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1)))

(define p-2-70-code-tree
  (generate-huffman-tree p-2-70-symbol-frequence))

(define msg-1 '(Get a job))
(encode msg-1 p-2-70-code-tree)

(define msg-2 '(Sha na na na na na na na na))
(encode msg-2 p-2-70-code-tree)

(define msg-3 '(Wah yip yip yip yip yip yip yip yip yip))
(encode msg-3 p-2-70-code-tree)
;; p2.70

; (load "huffman.scm")
