(define (make-record key obj) (cons key obj))
(define (key record) (car record))
(define (obj record) (cdr record))

(define (make-tree entry left right)
  (list entry left right))

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (lookup given-key tree)
  (if (null? tree)
      #f
      (let ((k (key (entry tree))))
        (cond ((= k given-key) (entry tree))
              ((> k given-key)
               (lookup given-key (left-branch tree)))
              (else (lookup given-key (right-branch tree)))))))
            

; tests
(define tree (list->tree (map make-record
                              '(1 2 3 4 5)
                              '(one two three four five))))
(lookup 1 tree)
(lookup 3 tree)
(lookup 4 tree)
(lookup 5 tree)
(lookup 6 tree)