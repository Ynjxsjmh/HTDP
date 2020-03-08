#lang racket

; Create an expression that deletes the ith position from str.

(define str "helloworld")
(define ind "0123456789")
(define i 5)

(define (delete_at str i)
  (if (> i (string-length str))
      (substring str 0 string-length)
      (string-append (substring str 0 i) (substring str (+ 1 i)))
      )
  )

(delete_at str i)
