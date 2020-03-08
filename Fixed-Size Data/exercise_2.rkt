#lang racket

;; use string primitives to create an expression that concatenates prefix and suffix and adds "_" between them

(define prefix "hello")
(define suffix "world")

(define (add_between prefix suffix)
  (string-append prefix "_" suffix)
  )

(add_between prefix suffix)
