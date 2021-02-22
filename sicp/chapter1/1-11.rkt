#lang sicp

(#%require rackunit)

(define (recursive-f n)
    (if (< n 3)
        n
        (+
            (recursive-f (- n 1)) 
            (recursive-f (- n 2))
            (recursive-f (- n 3)))))


(check-equal? (recursive-f 1) 1)
(check-equal? (recursive-f 2) 2)
(check-equal? (recursive-f 3) 3)
(check-equal? (recursive-f 4) 6)
(check-equal? (recursive-f 5) 11)
(check-equal? (recursive-f 6) 20)

(define (f n)
    (define (f-iter a b c count)
        (if (= count 0)
            c
            (f-iter b c (+ a b c) (- count 1))))
    
    (if (< n 3)
        n
        (f-iter 0 1 2 (- n 2))))


(check-equal? (f 1) 1)
(check-equal? (f 2) 2)
(check-equal? (f 3) 3)
(check-equal? (f 4) 6)
(check-equal? (f 5) 11)
(check-equal? (f 6) 20)