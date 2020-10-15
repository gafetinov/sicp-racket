#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (sum-of-squares x y)
    (+ (square x) (square y)))

(define (solution x y z)
    (cond ((and (<= x y) (<= x z)) (sum-of-squares y z))
        ((and (<= y x) (<= y z)) (sum-of-squares x z))
        ((and (<= z x) (<= z y)) (sum-of-squares x y))))

(check-equal? (solution 1 3 5) 34)
(check-equal? (solution 7 3 5) 74)
(check-equal? (solution 1 9 5) 106)
(check-equal? (solution 3 3 3) 18)
