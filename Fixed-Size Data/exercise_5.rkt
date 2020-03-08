#lang racket

;; Use the 2htdp/image library to create the image of a simple boat or tree. Make sure you can easily change the scale of the entire image.

(require 2htdp/image)


(define WIDTH 100)
(define HEIGHT 150)

;; https://stackoverflow.com/a/52141023/10315163
(define (create_tree w h)
  (define ang  (* (atan w h) (/ 180 pi)))
  (define dia  (sqrt (+ (* w w) (* h h))))
  (define crown (isosceles-triangle	(/ dia 2) (* 2 (floor ang)) "solid" "green"))
  (define trunk (rectangle (/ w 3) (/ h 2) "solid" "brown"))
  (define bg (empty-scene w h))

  (place-image crown (/ w 2) (/ h 4)
               (place-image trunk
                            (/ w 2) (* 3 (/ h 4))
                            bg)
               )
  )

(create_tree WIDTH HEIGHT)
