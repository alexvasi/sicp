(define tolerance 0.0001)

(define (iterative-improve improved-enough? improve)
  (lambda (null-val)
    (define (iter res)
      (if (improved-enough? res)
          res
          (iter (improve res))))
    (iter null-val)))


(define (sqrt x)
  (define (enough? val)
    (< (abs (- x (* val val)))
       tolerance))
  (define (avarage x y)
    (/ (+ x y) 2))
  (define (improve val)
    (avarage val (/ x val)))
  ((iterative-improve enough? improve) 1))

