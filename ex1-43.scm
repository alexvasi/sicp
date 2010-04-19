(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (1- n)))))

((repeated (lambda (x) (* x x)) 2) 5)
((repeated (lambda (x) (* x x)) 3) 2)
((repeated 1+ 10) 0)
