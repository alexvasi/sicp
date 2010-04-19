(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

; 1 + 2x, x = 2
(horner-eval 2 (list 1 2))

; 1 + 5x^2, x = 3
(horner-eval 3 (list 1 0 5))

; 1 + 3x + 5x^3 + x^5, x = 2
(horner-eval 2 (list 1 3 0 5 0 1))