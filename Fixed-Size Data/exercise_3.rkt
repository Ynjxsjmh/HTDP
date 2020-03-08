#lang racket

; Create an expression using string primitives that adds "_" at position i.

(define str "helloworld")
(define ind "0123456789")
(define i 5)

(define (insert_at str i)
  (if (> i (string-length str))
      (string-append str "_")
      (string-append (substring str 0 i) "_" (substring str i))

      )

  )

(insert_at str (string-length str))
