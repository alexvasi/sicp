(define (tree-map f tree)
  (map (lambda (item)
         (if (pair? item)
             (tree-map f item)
             (f item)))
       tree))

(define (square-tree tree)
  (tree-map (lambda (x) (* x x)) tree))

(define x (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))
x
(square-tree x)