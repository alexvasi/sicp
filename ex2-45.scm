(define (split large-f small-f)
  (define (splitter painter n)
    (if (= n 0)
        painter
        (let ((smaller (splitter painter (- n 1))))
          (large-f painter (small-f smaller smaller)))))
  splitter)

(define (split large-f small-f)
  (lambda (splitter painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split large-f small-f) painter (- n 1))))
          (large-f painter (small-f smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))