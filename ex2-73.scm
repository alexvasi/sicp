(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (install-deriv-sum-package)
  
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list a1 a2))))

  (define (deriv operands var)
    ((get 'make-exp '+)
     (deriv (car operands) var)
     (deriv (cadr operands) var)))

  (define (tag x) (attach-tag '+ x))
  (put 'make-exp '+
       (lambda (a1 a2) (tag (make-sum a1 a2))))
  (put 'deriv '+ deriv)
  'done)

(define (install-deriv-product-package)

  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list m1 m2))))

  (define (deriv operands var)
    (let ((make-sum (get 'make-exp '+))
          (make-product (get 'make-exp '*)))
      (make-sum
       (make-product (car operands)
                     (deriv (cadr operands) var))
       (make-product (cadr operands)
                     (deriv (car operands) var)))))

  (define (tag x) (attach-tag '* x))
  (put 'make-exp '*
       (lambda (m1 m2) (tag (make-product m1 m2))))
  (put 'deriv '* deriv)
  'done)

(define (install-deriv-exp-package)

  (define (make-exponentiation b e)
    (cond ((=number? e 1) b)
          ((=number? e 0) 1)
          ((and (number? b) (number? e)) (expt b e))
          (else (list '** b e))))

  (define (base e) (car e))
  (define (exponent e) (cadr e))

  (define (deriv operands var)
    (let ((make-product (get 'make-exp '*))
          (make-exp (get 'make-exp '**)))
      (make-product
       (make-product (exponent operands)
                     (make-exp (base operands)
                               (1- (exponent operands))))
       (deriv (base operands) var))))

  (define (tag x) (attach-tag '** x))
  (put 'make-exp '**
       (lambda (b e) (tag (make-exponentiation b e))))
  (put 'deriv '** deriv)
  'done)