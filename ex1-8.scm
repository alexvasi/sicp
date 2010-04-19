(define (cbrt-iter guess x)
  (define new_guess (improve guess x))
  (if (good-enough? guess new_guess)
      new_guess
      (cbrt-iter new_guess x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) guess guess)
     3))

(define (good-enough? guess new_guess)
  (< (/ (abs (- guess new_guess)) guess) 0.001))

(define (square x)
  (* x x))

(define (cbrt-test x)
  (cbrt-iter 1.0 x))
