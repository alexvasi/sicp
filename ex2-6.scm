(define zero
  (lambda (f) (lambda (x) x)))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (add n m)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))


;(((add (add two two) one) 1+) 0)