(define (make-point x y)
  (cons x y))
(define x-point car)
(define y-point cdr)


(define (make-segment p1 p2)
  (cons p1 p2))
(define (make-segment-p x1 y1 x2 y2)
  (make-segment (make-point x1 y1)
                (make-point x2 y2)))
(define start-segment car)
(define end-segment cdr)

(define (segment-len seg)
  (define (square x) (* x x))
  (let ((x1 (x-point (start-segment seg)))
        (x2 (x-point (end-segment seg)))
        (y1 (y-point (start-segment seg)))
        (y2 (y-point (end-segment seg))))
    (sqrt (+ (square (abs (- x1 x2)))
             (square (abs (- y1 y2)))))))


; area and perimeter
(define (area rect)
  (* (segment-len (rect-top rect))
     (segment-len (rect-left rect))))

(define (perimeter rect)
  (* 2 (+ (segment-len (rect-top rect))
          (segment-len (rect-left rect)))))


; rect by 2 opposite points
(define (make-rect p1 p2)
  (let ((x1 (x-point p1))
        (x2 (x-point p2))
        (y1 (y-point p1))
        (y2 (y-point p2)))
    (cons (make-point (min x1 x2) (min y1 y2))
          (make-point (max x1 x2) (max y1 y2)))))

(define (rect-top rect)
  (make-segment (make-point (x-point (car rect))
                            (y-point (cdr rect)))
                (cdr rect)))

(define (rect-left rect)
  (make-segment (car rect)
                (make-point (x-point (car rect))
                            (y-point (cdr rect)))))

; rect by two segments
(define (make-rect left top right bottom)
  (cons (make-segment (make-point left bottom)
                      (make-point left top))
        (make-segment (make-point left top)
                      (make-point right top))))

(define (rect-top rect)
  (cdr rect))

(define (rect-left rect)
  (car rect))