(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial x)
  (define (identity x) x)
  (product identity 1 1+ x))

(define (pi-by-wollis n)
  (define (add-two x)
    (+ x 2))
  (define (f n)
    (/ (* n (add-two n))
       (* (+ n 1) (+ n 1))))
  (* 4 (product f 2 add-two (* 2 n))))