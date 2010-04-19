(define (make-segment p1 p2)
  (cons p1 p2))

(define (make-segment-p x1 y1 x2 y2)
  (make-segment (make-point x1 y1)
                (make-point x2 y2)))

(define start-segment car)
(define end-segment cdr)

(define (make-point x y)
  (cons x y))
(define x-point car)
(define y-point cdr)

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment seg)
  (define (avarage a b) (/ (+ a b) 2))
  (make-point (avarage (x-point (start-segment seg))
                       (x-point (end-segment seg)))
              (avarage (y-point (start-segment seg))
                       (y-point (end-segment seg)))))

