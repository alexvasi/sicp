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

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)   ; symbol
                               (cadr pair)) ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge entries)
  (let ((entry1 (car entries)))
    (if (null? (cdr entries))
        entry1
        (let ((entry2 (cadr entries)))
          (successive-merge (adjoin-set (make-code-tree entry1
                                                        entry2)
                                        (cddr entries)))))))

(define rock-tree
  (generate-huffman-tree '((a 2) (boom 1) (get 2) (job 2) (na 16)
                           (sha 3) (yip 9) (wah 1))))

(define rock-message
  '(Get a job
    Sha na na na na na na na na
    Get a job
    Sha na na na na na na na na
    Wah yip yip yip yip yip yip yip yip yip
    Sha boom))

(define rock-encoded
  (encode rock-message rock-tree))