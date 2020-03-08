#lang racket

;;  Create an expression that computes whether a picture is "tall", "wide", or "square".

(require 2htdp/image)

(define pic (rectangle 20 90 "solid" "brown"))

(define (judge pic)
  (define height (image-height pic))
  (define width (image-width pic))
  (cond
    [(> height width)
     "tall"]
    [(< height width)
     "wide"]
    [(= height width)
     "square"]
    )
  )

(judge pic)
