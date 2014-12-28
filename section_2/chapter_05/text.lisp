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

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))
          
(defparameter *objects* '(whiskey bucket frog chain))

(defparameter *object-locations* '((whiskey living-room)
                                   (bucket living-room)
                                   (chain garden)
                                   (frog garden))) ; another association list 

(defun objects-at (loc objs obj-locs)
  (labels ((at-loc-p (obj)
            (eq (cadr (assoc obj obj-locs)) loc)))
  (remove-if-not #'at-loc-p objs)))

(defun describe-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
                    `(you see a ,obj on the floor.)))
  (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))

(defparameter *location* 'living-room) 

(defun look () ; not functional, reads global variables
               ; not passed into function when called 
  (append (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects* *object-locations*)))         