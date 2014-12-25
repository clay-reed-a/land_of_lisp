

;; LOCAL VARIABLES ;; 

(let ((a 5)  ;  ((variable assignments
      (b 6)) ;   (variable assignments)) 
  (+ a b))   ; local scope 


;; LOCAL FUNCTIONS ;; 

(flet ((f (n)        ; (flet ((function_name (arguments)       
          (+ n 10))) ;  ...function body...))
  (f 5))             ; ..local scope..)


;; "To make function names available in defined functions,
;; we can use the labels command", 
;; labels is used to implement recursion 

(labels ((a (n)
            (+ n 5))
         (b (n)
            (+ (a n) 6))) ; we need to use labels 
    (b 10))               ; to get a in b 

