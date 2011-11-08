(define (make-point x y)
 (cons x y))
(define (x-point p)
 (car p))
(define (y-point p)
 (cdr p))
(define (make-segment start end)
 (cons start end))
(define (start-segment segment)
 (car segment))
(define (end-segment segment)
 (cdr segment))
(define (midpoint-segment segment)
 (make-point (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2) (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2)))

(define (square x)
 (* x x))
(define (length-segment segment)
 (let ((start (start-segment segment)) (end (end-segment segment)))
   (sqrt (+ (square (- (x-point start) (x-point end))) (square (- (y-point start) (y-point end)))))))

(define (print-point p)
 (print (x-point p) " " (y-point p)))

(define (make-rectangle segment len)
 (cons segment len))
(define (segment-rectangle rec)
 (car rec))
(define (length-rectangle rec)
 (cdr rec))

(define (perimeter rec)
 (+ (* (length-segment (segment-rectangle rec)) 2) (* (abs (length-rectangle rec)) 2)))
(define (area rec)
 (* (length-segment (segment-rectangle rec)) (abs (length-rectangle rec))))

(define zero (make-point 0 0))
(define y-2 (make-point 0 2))
(define x-2-y-2 (make-point 2 2))
(define segment1 (make-segment zero y-2))
(define segment2 (make-segment zero x-2-y-2))
(define rec1 (make-rectangle segment1 2))
(define rec2 (make-rectangle segment2 3))
#?=(perimeter rec2)
#?=(area rec2)
