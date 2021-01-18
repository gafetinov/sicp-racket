#lang sicp

(#%require rackunit)

(define accuracy 0.001)

(define (get-approximation y x)
    (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (good-enough? prev current)
    (< (abs (- prev current)) accuracy))

(define (sqrt3-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt3-iter (get-approximation guess x) x)))

(define (sqrt3 x)
    (sqrt3-iter 1.0 x))

(check-= (sqrt3 9) 3 accuracy)
(check-= (sqrt3 2) 1.4142135623746899 accuracy)
(check-= (sqrt3 0.0003211) 0.017919263 accuracy)
(check-= (sqrt3 1111111111111111) 33333333.333333332 accuracy)