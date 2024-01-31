#!/usr/bin/guile -s
!#

;ROSELLO, MA. JAZMINE P.
;2021-09665
; CMSC 124-ST7L
;OCTOBER 1, 2023
;program that separate characters that are symbols and numbers. The output will be symbols followed by the sorted number in descending form..

;To sort the digitList
( define (sortdigits1 list1 order) 
    ( if ( null? list1) ;if null na ang list1 then return nalang ang order na list which is the sorted descending order
        order
        (sortdigits1 (delete (apply min list1) list1) (cons (apply min list1) order))
        ;for call function, ang ipasa na list for list1 na paramater ay 'yung list na tinanggalan ng minimum tapos sa order ipasa 'yung cons na minimum sa orderlist'
    )
)

( define ( separateDigits list1 digitList symbolList)
   (cond
        (( null? list1) (append symbolList (sortdigits1 digitList '()))) ;kung null na ang list append the symbolList sa niretrun na sorted list ng sortDigits1 na function
        ((number? (car list1))  (separateDigits (cdr list1) (cons ( car list1 ) digitList ) symbolList)) ;kung number 'yung element then ilagay lang sa digitList tas icall uli function to check throughout the list
        (else (separateDigits (cdr list1) digitList (cons (car list1) symbolList)))
   )    ;kung symbol naman edi lagay lang sa symbolList tas call lang uli function
)

;main function with helper to call the separate digits function
(define (sortDigits lIst)
    (separateDigits lIst '() '())
)

(display "\n")
(display (sortDigits '(a 2 s 4 5 f)))
(display "\n\n")