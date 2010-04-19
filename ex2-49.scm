(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (segments->painter segment-list)
 (lambda (frame)
   (for-each
    (lambda (segment)
      (draw-line
       ((frame-coord-map frame) (start-segment segment))
       ((frame-coord-map frame) (end-segment segment))))
    segment-list)))

(define frame->painter
  (let ((tl (make-vect 0 1))
        (tr (make-vect 1 1))
        (bl (make-vect 0 0))
        (br (make-vect 1 0)))
    (segments->painter (list (make-segment tl tr)
                             (make-segment tr br)
                             (make-segment br bl)
                             (make-segment bl tl)))))

(define x->painter
  (segments->painter (list (make-segment (make-vect 0 0)
                                         (make-vect 1 1))
                           (make-segment (make-vect 1 0)
                                         (make-vect 0 1)))))

(define diamond->painter
  (let ((top (make-vect 0.5 1))
        (right (make-vect 1 0.5))
        (bottom (make-vect 0.5 0))
        (left (make-vect 0 0.5)))
    (segments->painter (list (make-segment left top)
                             (make-segment top right)
                             (make-segment right bottom)
                             (make-segment bottom left)))))
