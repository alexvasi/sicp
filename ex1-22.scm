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

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (define (runtime) (get-internal-run-time))
  (define (start-prime-test n start-time)
    (cond ((prime? n)
	   (report-prime n (- (runtime) start-time))
	   #t)
	  (else #f)))
  (define (report-prime num elapsed-time)
    (display num)
    (display " *** ")
    (display elapsed-time)
    (newline))
  (start-prime-test n (runtime)))

(define (search-for-primes num count)
  (cond ((= 0 count) (newline)(display "done"))
	((timed-prime-test num)
	 (search-for-primes (+ num 1) (- count 1)))
	(else (search-for-primes (+ num 1) count))))
