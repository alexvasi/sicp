(define (accumulate combiner null-val term a next b)
  (if (> a b)
      null-val
      (combiner (term a)
                (accumulate combiner
                            null-val
                            term
                            (next a)
                            next
                            b))))

(define (accumulate combiner null-val term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-val))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))