(define (double x) (* 2 x))
(define (halve x) (/ x 2))

(define (multi a b)
  (if (= b 0)
      0
      (+ a (multi a (- b 1)))))

(define (multi a b)
  (cond ((= b 0) 0)
	((even? b) (multi (double a) (halve b)))
	(else (+ a (multi a (- b 1))))))
