(define (my-reverse items)
  (define (iter tail res)
    (if (null? tail)
        res
        (iter (cdr tail)
              (cons (car tail) res))))
  (iter items (list)))

(my-reverse (list 1 4 9 16 25))
