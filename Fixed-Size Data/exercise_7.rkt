#lang racket

;; Create an expression that computes whether sunny is false or friday is true.

(define sunny #true)
(define friday #false)

(or (equal? sunny #false) (equal? friday #true))
