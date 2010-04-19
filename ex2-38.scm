(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))

(fold-right / 1 `(1 2 3))
(fold-left / 1 `(1 2 3))

(fold-right list `() `(1 2 3))
(fold-left list `() `(1 2 3))
