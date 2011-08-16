(define (make-account balance password)
  (let ((incorrect-times 0))
    (define (withdraw amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount))
          balance)
        "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (incorrect foo)
      "Incorrect password")
    (define (call-the-cops)
      (error "Omawarisan!!!!"))

    (define (dispatch pass m)
      (if (eq? password pass)
        (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request"
                       m)))
        (begin (set! incorrect-times (+ incorrect-times 1))
          (if (> incorrect-times 7)
            (call-the-cops)
            incorrect))))
  dispatch))

(define acc (make-account 100 'hoge))
((acc 'hoge 'withdraw) 40)
((acc 'bar 'deposit) 50)
((acc 'bar 'deposit) 50)
((acc 'bar 'deposit) 50)
((acc 'bar 'deposit) 50)
((acc 'bar 'deposit) 50)
#?=((acc 'bar 'deposit) 50)
#?=((acc 'bar 'deposit) 50)
#?=((acc 'bar 'deposit) 50)
