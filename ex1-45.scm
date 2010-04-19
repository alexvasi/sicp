(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (avarage x y)
  (/ (+ x y) 2))

(define (avarage-damp f)
  (lambda (x) (avarage (f x) x)))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (1- n)))))

(define (root x n)
  (define (f y)
    (/ x (expt y (1- n))))
  (define (slow-down f)
    (let ((count (floor (/ (log n)
                           (log 2)))))
      (lambda (y)
        (((repeated avarage-damp count) f) y))))
  (fixed-point (slow-down f) 1))

