(define (make-interval a b)
  (cons a b))

(define (upper-bound i)
  (max (car i) (cdr i)))

(define (lower-bound i)
  (min (car i) (cdr i)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
