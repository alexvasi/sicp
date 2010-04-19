(define (my-last-pair items)
  (let ((last (cdr items)))
    (if (null? last)
        items
        (my-last-pair last))))

(my-last-pair (list 23 72 149 34))