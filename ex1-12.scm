(define (pascal row n)
  (cond ((or (< row 0) (< n 0) (> n row)) 0)
	((or (= n 0) (= n row)) 1)
	(else (+ (pascal (- row 1) (- n 1))
		 (pascal (- row 1) n)))))