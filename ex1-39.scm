(define (cont-frac n d k)
  (define (iter k res)
    (if (= k 0)
        res
        (iter (1- k) (/ (n k)
                        (+ (d k) res)))))
  (iter k 0))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (* x x))))
             (lambda (x) (1- (* x 2)))
             k))
