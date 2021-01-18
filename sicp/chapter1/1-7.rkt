#lang sicp

(#%require rackunit)

(define accuracy 0.00000001)

(define (square x) (* x x))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) accuracy))


(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))


(check-= (sqrt 4) 2 accuracy)
(check-= (sqrt 2) 1.4142135623746899 accuracy)
(check-= (sqrt 0.0003211) 0.017919263 accuracy)
(check-= (sqrt 1111111111111111) 33333333.333333332 accuracy)



(define (new-good-enough? prev current)
    (< (abs (- prev current)) accuracy))

(define (new-sqrt-iter guess x)
    (if (new-good-enough? guess x)
        guess
        (new-sqrt-iter (improve guess x) x)))

(define (new-sqrt x)
    (new-sqrt-iter 1.0 x))

(check-= (sqrt 4) 2 accuracy)
(check-= (sqrt 2) 1.4142135623746899 accuracy)
(check-= (sqrt 0.0003211) 0.017919263 accuracy)
(check-= (sqrt 1111111111111111) 33333333.333333332 accuracy)