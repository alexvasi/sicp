; Numbers that fool the Fermat test are called Carmichael numbers, and
; little is known about them other than that they are extremely
; rare. There are 255 Carmichael numbers below 100,000,000. The
; smallest few are 561, 1105, 1729, 2465, 2821, and 6601.


(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n testval)
  (= (expmod testval n n) testval))

(define (fermat-full-test n)
  (define (iter n testval)
    (cond ((>= testval n) "done")
          ((fermat-test n testval)
           (iter n (+ testval 1)))
          (else
           (display "false for ")
           (display testval)(newline)
           (iter n (+ testval 1)))))
  (iter n 2))
