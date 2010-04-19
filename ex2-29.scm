(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (mobile? structure)
  (list? structure))

(define (total-weight mobile)
  (if (mobile? mobile)
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile))))
      mobile))

(define (torque branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

(define (is-balanced mobile)
  (if (not (mobile? mobile))
      #t
      (and (= (torque (left-branch mobile))
              (torque (right-branch mobile)))
           (is-balanced (branch-structure (left-branch mobile)))
           (is-balanced (branch-structure (right-branch mobile))))))
 
(define m1 (make-mobile (make-branch 1 2)
                        (make-branch 3 4)))

(define m2 (make-mobile (make-branch 5 m1)
                        (make-branch 6 m1)))

(define m3 (make-mobile (make-branch 7 m1)
                        (make-branch 8 m2)))

(define b1 (make-mobile (make-branch 3 4)
                        (make-branch 2 6)))

(define b2 (make-mobile (make-branch 2 b1)
                        (make-branch 4 5)))