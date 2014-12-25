;; globally-defined variables are called 

    ;; TOP-LEVEL DEFINITIONS ;; 

;; this is done w/ the defparameter function 

(defparameter *small* 1) ; we put the top-level definitions  
(defparameter *big* 100) ; in *earmuffs*  


;; you can also use the defvar function, 

(defvar *big* 2) ; which won't overwrite previous values 

;; functions are defined w/ the syntax 

    ;; (defun function_name (args) ;;
    ;;  ...)                       ;;

;; functions are called w/ the syntax 

    ;; (function_name arg arg)



(defun guess-my-number ()
  (ash (+ *small* *big*) -1))

;; ash - arithmetic shift 
;; looks at a number in 
;; 1 + 100     = 101 
;; 1 + 1100100 = 1100101 
;; its binary form & 
;; moves the bigs to the left or right 
;; according to the second arg 
;;               110010 (binary for 50)


(defun smaller ()
  (setf *big* (1- (guess-my-number))) ; *big* becomes 49 
  (guess-my-number))

(defun bigger ()
  (setf *small* (1+ (guess-my-number))) ; *small* becomes 51 
  (guess-my-number))

(defun start-over ()
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))


