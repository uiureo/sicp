(define (cons a b)
  (define (pow x y)
    (if (= y 0)
      1
      (* x (pow x (- y 1)))))
  (* (pow 2 a) (pow 3 b)))
(define (div x y n)
  (if (= (remainder x y) 0)
     (div (/ x y) y (+ n 1))
     n))
(define (car z)
  (div z 2 0))
(define (cdr z)
  (div z 3 0))
