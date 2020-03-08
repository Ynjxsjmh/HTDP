#lang racket

;; Create an expression that converts the value of `in` to a positive number.
;;; For a String, it determines how long the String is;
;;; for an Image, it uses the area;
;;; for a Number, it decrements the number by 1,
;;; unless it is already 0 or negative;
;;; for #true it uses 10 and for #false 20.

(require 2htdp/image)

(define (converter in)
  (cond
    [(string? in)
     (string-length in)]

    [(image? in)
     (* (image-width in) (image-height in))]

    [(number? in)
     (if (< in 0)
         (- 0 in)
         (- in 1)
         )
     ]

    [(boolean? in)
     (if (equal? in #true)
         10
         20
         )]
    )
  )

(converter 10)
