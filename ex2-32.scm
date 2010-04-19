(define (subsets s)
  (if (null? s)
      (list ())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (item) (cons (car s) item))
                          rest)))))

(subsets (list 1 2 3))