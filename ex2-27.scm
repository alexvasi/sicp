(define (my-reverse items)
  (define (iter tail res)
    (if (null? tail)
        res
        (iter (cdr tail)
              (cons (car tail) res))))
  (iter items (list)))

(define (deep-reverse items)
  (define (iter tail res)
    (cond ((not (list? tail)) tail)
          ((null? tail) res)
          (else (iter (cdr tail)
                (cons (iter (car tail) (list)) res)))))
  (iter items (list)))


(define x (list (list 1 2) (list 3 4)))
x
(my-reverse x)
(deep-reverse x)