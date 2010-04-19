(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (define (divides? a b)
      (= (remainder b a) 0))
    (define (square x)
      (* x x))
    (find-divisor n 2))
  (= n (smallest-divisor n)))

(define (accumulate combiner null-val filter term a next b)
  (cond ((> a b) null-val)
        ((filter a) (combiner (term a)
                              (accumulate combiner
                                          null-val
                                          filter
                                          term
                                          (next a)
                                          next
                                          b)))
        (else (accumulate combiner
                          null-val
                          filter
                          term
                          (next a)
                          next
                          b))))

(define (sum-squares-of-primes a b)
  (define (square x) (* x x))
  (accumulate + 0 prime? square a 1+ b))

