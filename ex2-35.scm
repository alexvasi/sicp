(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; actually we dont to test for end of list (null? clause)
(define (count-leaves t)
  (accumulate + 0 (map (lambda (node)
                         (cond ((null? node) 0)
                               ((pair? node) (count-leaves node))
                               (else 1)))
                       t)))

