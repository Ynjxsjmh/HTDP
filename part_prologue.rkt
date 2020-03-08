#lang racket

(require 2htdp/image)
(require 2htdp/universe)

; numbers and arithmetic

(+ 1 1)
(+ 2 2)
(* 3 3)
(- 4 2)
(/ 6 2)

(sqr 3)
(expt 2 3)
(sin 0)
(cos pi) ; Its “#i” prefix is short for “I don’t really know the precise number so take that for now” or an inexact number.

(+ 1 2 3 4 5 6 7 8 9 0)
(* 1 2 3 4 5 6 7 8 9 0)


; strings

(string-append "hello " "world")

(+ (string-length "hello world") 20)

(number->string 42)

(string->number "42")

; Boolean values

(and #true #true)
(or #true #false)
(not #false)

;; “convert” two numbers into a Boolean

(> 10 9)
(< -1 0)
(= 42 9)
(>= 10 10)
(<= -1 0)
(string=? "design" "tinker")


; images

(circle 10 "solid" "red")

(rectangle 30 20 "outline" "blue")

(overlay (circle 5 "solid" "red")
         (rectangle 20 20 "solid" "blue")
         (rectangle 30 30 "solid" "green")
         )

(overlay (rectangle 30 30 "solid" "green")
         (rectangle 20 20 "solid" "blue")
         (circle 5 "solid" "red")
         )
;; overlay 感觉是分层，第一个在最上一层，最后一个在最下一层

(image-width (square 10 "solid" "red"))


(place-image (circle 5 "solid" "green")
             50 80
             (empty-scene 100 100))
;; 左上角是原点

;; To program is to write down an arithmetic expression, but you’re no longer restricted to boring numbers. In BSL, arithmetic is the arithmetic of numbers, strings, Booleans, and even images.


; Inputs and Output

(define (y x) (* x x))

(y 1) ;; (y 1) is called a function application  in DrRacket.


(define (picture-of-circle height)
  (place-image
   (circle 5 "solid" "red")
   50 height
   (empty-scene 100 60)))

(picture-of-circle 20)

(animate picture-of-circle)


; conditional expression
(define (sign x)
  (cond
    [(> x 0) 1]
    [(= x 0) 0]
    [(< x 0) -1]))


(define (picture-of-circle.v2 height)
  (cond
    [(<= height 60)
     (place-image
      (circle 5 "solid" "red")
      50 height
      (empty-scene 100 60))]
    [(> height 60)
     (place-image
      (circle 5 "solid" "red")
      50 60
      (empty-scene 100 60))]))


(animate picture-of-circle.v2)


(define (picture-of-circle.v3 height)
  (cond
    [(<= height (- 60 (/ (image-height (circle 5 "solid" "red") ) 2)))
     (place-image (circle 5 "solid" "red") 50 height
                  (empty-scene 100 60))]
    [(> height (- 60 (/ (image-height (circle 5 "solid" "red") ) 2)))
     (place-image (circle 5 "solid" "red")  50 (- 60 (/ (image-height ) 2))
                  (empty-scene 100 60))]))

(animate picture-of-circle.v3)

; One Program, Many Definitions


;; constant definitions

(define (picture-of-circle.v4 h)
  (cond
    [(<= h (- HEIGHT (/ (image-height CIRCLE) 2)))
     (place-image CIRCLE 50 h (empty-scene WIDTH HEIGHT))]
    [(> h (- HEIGHT (/ (image-height CIRCLE) 2)))
     (place-image CIRCLE
                  50 (- HEIGHT (/ (image-height CIRCLE) 2))
                  (empty-scene WIDTH HEIGHT))]))

(define WIDTH 100)
(define HEIGHT 60)
(define CIRCLE (circle 5 "solid" "red"))

(animate picture-of-circle.v4)

;; What a good programmer would never live with, however, is having a program contain the same expression three times:
;; Once you eliminate all repeated expressions, you get the program below
; constants
(define WIDTH  100)
(define HEIGHT  60)
(define MTSCN  (empty-scene WIDTH HEIGHT))
(define CIRCLE (circle 5 "solid" "red"))
(define CIRCLE-CENTER-TO-TOP
  (- HEIGHT (/ (image-height CIRCLE) 2)))

; functions
(define (picture-of-circle.v5 h)
  (cond
    [(<= h CIRCLE-CENTER-TO-TOP)
     (place-image CIRCLE 50 h MTSCN)]
    [(> h CIRCLE-CENTER-TO-TOP)
     (place-image CIRCLE 50 CIRCLE-CENTER-TO-TOP MTSCN)]))


(animate picture-of-circle.v6)


; properties of the "world" and the descending circle
(define WIDTH  100)
(define HEIGHT  60)
(define V 3)
(define X 50)

; graphical constants
(define MTSCN  (empty-scene WIDTH HEIGHT))
(define CIRCLE (circle 5 "solid" "red"))
(define CIRCLE-CENTER-TO-TOP
  (- HEIGHT (/ (image-height CIRCLE) 2)))

; functions
(define (distance t)
  (* V t))

(define (picture-of-circle.v6 t)
  (cond
    [(<= (distance t) CIRCLE-CENTER-TO-TOP)
     (place-image CIRCLE X (distance t) MTSCN)]
    [(> (distance t) CIRCLE-CENTER-TO-TOP)
     (place-image CIRCLE X CIRCLE-CENTER-TO-TOP MTSCN)]))

(animate picture-of-circle.v6)

; Acquiring the mechanical skills of programming—learning to write expressions that the computer understands, getting to know which functions and libraries are available, and similar activities—isn’t helping you all that much with **real** programming. If it were, you could equally well learn a foreign language by memorizing a thousand words from the dictionary and a few rules from a grammar book.

; Good programming is far more than the mechanics of acquiring a language. Most importantly, it is about keeping in mind that programmers create programs for other people to read them in the future. A good program reflects the problem statements and its important concepts. It comes with a concise self-description. Examples illustrate this description and relate it back to the problem. The examples make sure that the future reader knows why and how your code works. In short, good programming is about solving problems systematically and conveying the system within the code. Best of all, this approach to programming actually makes programming accessible to everyone—so it serves two masters at once.

