(define (fringe items)
  (if (null? items)
      (list)
      (if (list? items)
          (append (fringe (car items))
                  (fringe (cdr items)))
          (list items))))

(define x (list (list 1 2) (list 3 4)))
x

(fringe x)
(fringe (list x x))