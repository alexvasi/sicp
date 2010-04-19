; integer -> rational -> real -> complex

(define (raise-integer->rational n)
  (make-rational n 1))

(define (raise-rational->real n)
  (make-real (/ (rational-numer n)
                (rational-denom n))))

(define (raise-real->complex n)
  (make-complex-from-real-imag n 0))

(put 'raise '(integer) raise-integer->rational)
(put 'raise '(rational) raise-rational->real)
(put 'raise '(real) raise-real->complex)

(define (raise n)
  (apply-generic 'raise n))