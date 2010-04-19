(define (cont-frac n d k)
  (define (iter k res)
    (if (= k 0)
        res
        (iter (1- k) (/ (n k)
                        (+ (d k) res)))))
  (iter k 0))

(define (euler x)
  (let ((mod3 (mod (- x 2) 3)))
    (if (= mod3 0)
        (+ 2 (* (/ (- x 2) 3) 2))
        1)))

(+ 2 (cont-frac (lambda (x) 1) euler 20))
