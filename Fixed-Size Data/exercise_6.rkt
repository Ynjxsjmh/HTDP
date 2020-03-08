#lang racket

;; Create an expression that counts the number of pixels in the image.

(require 2htdp/image)

(define pic (rectangle 20 90 "solid" "brown"))


(define (calc_pixels pic)
  (* (image-height pic) (image-width pic))
  )


(calc_pixels pic)
