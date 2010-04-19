(define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

(define (slow-expt b n)
  (define (iter product n)
    (if (= n 0)
	product
        (iter (* product b) (- n 1))))
  (iter 1 n))

(define (fast-expt b n)
  (define (iter product b n)
    (cond ((= n 0) product)
	  ((even? n) (iter product (square b) (/ n 2)))
	  (else (iter (* product b) b (- n 1)))))
  (iter 1 b n))