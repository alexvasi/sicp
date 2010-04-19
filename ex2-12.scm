(define (make-interval a b)
  (cons a b))

(define (upper-bound i)
  (max (car i) (cdr i)))

(define (lower-bound i)
  (min (car i) (cdr i)))

(define (make-center-percent center tolerance)
  (let ((k (* center (/ tolerance 100))))
    (make-interval (- center k) (+ center k))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (/ (* 100 (/ (- (upper-bound i) (lower-bound i)) 2))
     (center i)))