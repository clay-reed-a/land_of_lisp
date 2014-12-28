; text is alien to the computer 

(defparameter *nodes* '((living-room (you are in the living room.
                            a wizard is snoring loudly on the couch.))
                        (garden (you are in a beautiful garden.
                            there is a well in front of you.))
                        (attic (you are in the attic.
                          there is a giant welding torch in the corner.))))
                        ; *nodes* is an alist, an association list 

(defun describe-location (location nodes)
  (cadr (assoc location nodes))) 

; *edges* connect nodes in a graph 
(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))


; quasiquoting --  
; use a backtic rather than a singlequote to enter data mode, 
; use a comma to switch back to code mode. 
; A comma is thus a upside down backtic 
(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

 