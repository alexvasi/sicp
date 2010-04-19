(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (encode message tree)
  (if (null? message)
      '()
       (append (encode-symbol (car message) tree)
               (encode (cdr message) tree))))

(define (encode-symbol s tree)
  (if (leaf? tree)
      '()
      (cond ((memq s (symbols (left-branch tree)))
             (cons 0 (encode-symbol s (left-branch tree))))
            ((memq s (symbols (right-branch tree)))
             (cons 1 (encode-symbol s (right-branch tree))))
            (else (error "Encode tree has no symbol:" s)))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

; '(0 1 1 0 0 1 0 1 0 1 1 1 0)
(define sample-message '(a d a b b c a))
(encode sample-message sample-tree)