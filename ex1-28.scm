;; fuck, hate this ex
(require 'random)

(define (!= x y)
    (not (= x y)))

(define (square x)
  (* x x))

(define (check s r m)
  (cond ((and (!= s 1) (!= s (- m 1)) (= r 1)) 0)
        (else r)))

(define (check-omg s m)
  (check s (remainder (square s) m) m))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (check-omg (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
  (= (expmod (+ (random (- n 2)) 2)
             (- n 1) n)
     1))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else #f)))