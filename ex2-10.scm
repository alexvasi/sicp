(define (make-interval a b)
  (cons a b))

(define (upper-bound i)
  (max (car i) (cdr i)))

(define (lower-bound i)
  (min (car i) (cdr i)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (in-interval? x interval)
  (and (>= x (lower-bound interval))
       (<= x (upper-bound interval))))

(define (div-interval x y)
  (if (in-interval? 0 y)
      (error "interval division by null")
      (mul-interval x
                    (make-interval (/ 1 (upper-bound y))
                                   (/ 1 (lower-bound y))))))
