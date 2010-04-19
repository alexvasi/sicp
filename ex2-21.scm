(define (square-list items)
  (if (null? items)
      (list)
      (cons (expt (car items) 2)
            (square-list (cdr items)))))

(square-list (list 1 2 3 4))


(define (square-list items)
  (map (lambda (x) (expt x 2)) items))

(square-list (list 1 2 3 4))