#lang sicp

(#%require rackunit)

(define accuracy 0.001)

(define (get-approximation y x)
    (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (good-enough? prev current)
    (< (abs (- prev current)) accuracy))

(define (sqrt3-iter guess x)
    (define next-guess (get-approximation guess x))
    (if (good-enough? guess next-guess)
        next-guess
        (sqrt3-iter next-guess x)))

(define (sqrt3 x)
    (sqrt3-iter 1.0 x))


(check-= (sqrt3 1) 1 accuracy)
(check-= (sqrt3 8) 2 accuracy)
(check-= (sqrt3 0.0003211) 0.068477322 accuracy)
(check-= (sqrt3 1111111111111111) 103574.416865129 accuracy)