(define (sqrt-iter guess x)
  (define new_guess (improve guess x))
  (if (good-enough? guess new_guess)
      new_guess
      (sqrt-iter new_guess x)))

(define (improve guess x)
  (avarage guess (/ x guess)))

(define (avarage x y)
  (/ (+ x y) 2))

(define (good-enough? guess new_guess)
  (< (/ (abs (- guess new_guess)) guess) 0.001))

(define (square x)
  (* x x))

(define (sqrt-test x)
  (sqrt-iter 1.0 x))
