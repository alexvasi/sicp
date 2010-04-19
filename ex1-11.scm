(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3)))))

(define (fi n)
  (define (iter count fn-1 fn-2 fn-3)
    (if (> count n)
	fn-1
	(iter (+ count 1)
	      (+ fn-1 (* 2 fn-2) (* 3 fn-3))
	      fn-1
	      fn-2)))
  (if (< n 3) n (iter 3 2 1 0)))


