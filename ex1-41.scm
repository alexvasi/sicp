(define (double f)
  (lambda (x)
    (f (f x))))

(((double (double double)) 1+) 5)