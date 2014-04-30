(SETQ LS '(1 2 3 4 5 6 7 8))
(defun recur (LS)
 (if (null LS)
   nil
   (cons (reverse ( CAR LS)) (recur(CDR LS)))) 
)
(recur LS)

