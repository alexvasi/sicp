(define (double x) (* 2 x))
(define (halve x) (/ x 2))

(define (multi a b)
  (if (= b 0)
      0
      (+ a (multi a (- b 1)))))

(define (multi a b)
  (define (iter product a b)
    (cond ((= b 0) product)
	  ((even? b) (iter product (double a) (halve b)))
	  (else (iter (+ product a) a (- b 1)))))
  (iter 0 a b))