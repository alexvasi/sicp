; vectors to test frames
(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))
(define origin (make-vect 0 0))
(define e1 (make-vect 3 1))
(define e2 (make-vect -1 2))


(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

; test
(define f (make-frame origin e1 e2))
f
(origin-frame f)
(edge1-frame f)
(edge2-frame f)


(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (cddr frame))

; test another impl
(define f (make-frame origin e1 e2))
f
(origin-frame f)
(edge1-frame f)
(edge2-frame f)