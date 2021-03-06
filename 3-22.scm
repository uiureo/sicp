(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty-queue?)
      (null? front-ptr))
    (define (set-front-ptr! item)
      (set! front-ptr item))
    (define (set-rear-ptr! item)
      (set! rear-ptr item))
    (define (front-queue)
      (if (empty-queue?)
        (error "FRONT called with an empty queue" queue)
        (car front-ptr)))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair)
               front-ptr)
          (else
            (set-cdr! rear-ptr new-pair)
            (set-rear-ptr! new-pair)
            front-ptr))))
    (define (delete-queue!)
      (cond ((empty-queue?)
              (error "DAME!!!!!!" front-ptr))
        (else 
          (set-front-ptr! (cdr front-ptr))
          front-ptr)))
    (define (dispatch m)
      (cond ((eq? m 'empty?) empty-queue?)
        ((eq? m 'front) front-queue)
        ((eq? m 'insert) insert-queue!)
        ((eq? m 'delete) delete-queue!)
        (else front-ptr)))
      dispatch))

(define q (make-queue))
#?=((q 'empty?))
#?=((q 'insert) 'a)
#?=((q 'insert) 'b)
#?=((q 'delete))
#?=((q 'insert) 'c)
#?=((q 'front))
