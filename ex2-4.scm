(define (cons-m x y)
  (lambda (m) (m x y)))

(define (car-m z)
  (z (lambda (p q) p)))

(define (cdr-m z)
  (z (lambda (p q) q)))