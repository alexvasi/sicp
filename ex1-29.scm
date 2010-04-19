(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(define (integral-simpson f a b n)
  (define (h a b n)
    (/ (- b a) n))
  (define (y-mult k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((even? k) 2)
          (else 4)))
  (define (y k)
    (* (y-mult k)
       (f (+ a (* k (h a b n))))))
  (* (/ (h a b n) 3)
     (sum y 0 1+ n)))