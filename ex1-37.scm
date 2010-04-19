(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n k)
           (+ (d k) (iter (1+ i))))))
  (iter 1))

(define (cont-frac2 n d k)
  (define (iter k res)
    (if (= k 0)
        res
        (iter (1- k) (/ (n k) (+ (d k) res)))))
  (iter k 0))

(define (const-one x) 1)

(cont-frac const-one const-one 15)
(cont-frac2 const-one const-one 15)
(/ 1 (/ (+ 1 (sqrt 5)) 2))