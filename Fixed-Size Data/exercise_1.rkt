#lang racket

;; https://htdp.org/2019-02-24/part_one.html#%28counter._%28exercise._arith-n%29%29

;; 笛卡尔坐标系举例原点公式

(define x 3)
(define y 4)

(define (power x)
  (* x x)
  )

(define (distance x y)
  (sqrt (+ (power x) (power y)))
  )

(distance x y)
