(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append `() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      `()
      (cons low (enumerate-interval (1+ low) high))))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (unique-trios n)
  (flatmap
   (lambda (k)
     (map (lambda (p) (append (list k) p))
          (unique-pairs (1- k))))
   (enumerate-interval 1 n)))

(define (sum-trios n sum)
  (filter (lambda (trio)
            (= sum (accumulate + 0 trio)))
          (unique-trios n)))