(define (square-tree tree)
  (cond ((null? tree) (list))
        ((pair? tree) (cons (square-tree (car tree))
                            (square-tree (cdr tree))))
        (else (* tree tree))))

(define (square-tree tree)
  (map (lambda (item)
         (if (pair? item)
             (square-tree item)
             (* item item)))
       tree))

(define x (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))
x
(square-tree x)